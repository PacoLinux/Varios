// NB.cpp : Defines the entry point for the console application.
//
/*
 * The Great Computer Language Shootout
 * http://shootout.alioth.debian.org/
 *
 * contributed by Christoph Bauer
 *
 */

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <fstream>
#include <iostream>
#include <iomanip>
#include <cstdlib>

using namespace std;

#define pi 3.141592653589793
#define solar_mass (4 * pi * pi)
#define days_per_year 365.24


struct planet {
  double x, y, z;
  double vx, vy, vz;
  double mass;
};

void advance(int nbodies, struct planet * bodies, double dt)
{
  int i, j;

  for (i = 0; i < nbodies; i++) {
    struct planet * b = &(bodies[i]);
    for (j = i + 1; j < nbodies; j++) {
      struct planet * b2 = &(bodies[j]);
      double dx = b->x - b2->x;
      double dy = b->y - b2->y;
      double dz = b->z - b2->z;
      double distance = sqrt(dx * dx + dy * dy + dz * dz);
      double mag = dt / (distance * distance * distance);
      b->vx -= dx * b2->mass * mag;
      b->vy -= dy * b2->mass * mag;
      b->vz -= dz * b2->mass * mag;
      b2->vx += dx * b->mass * mag;
      b2->vy += dy * b->mass * mag;
      b2->vz += dz * b->mass * mag;
    }
  }

  for (i = 0; i < nbodies; i++) {
    struct planet * b = &(bodies[i]);
    b->x += dt * b->vx;
    b->y += dt * b->vy;
    b->z += dt * b->vz;
  }
}

double energy(int nbodies, struct planet * bodies)
{
  double e;
  int i, j;

  e = 0.0;
  for (i = 0; i < nbodies; i++) {
    struct planet * b = &(bodies[i]);
    e += 0.5 * b->mass * (b->vx * b->vx + b->vy * b->vy + b->vz * b->vz);
    for (j = i + 1; j < nbodies; j++) {
      struct planet * b2 = &(bodies[j]);
      double dx = b->x - b2->x;
      double dy = b->y - b2->y;
      double dz = b->z - b2->z;
      double distance = sqrt(dx * dx + dy * dy + dz * dz);
      e -= (b->mass * b2->mass) / distance;
    }
  }
   return e;
}

void offset_momentum(int nbodies, struct planet * bodies)
{
  double px = 0.0, py = 0.0, pz = 0.0;
  int i;
  for (i = 0; i < nbodies; i++) {
    px -= bodies[i].vx * bodies[i].mass;
    py -= bodies[i].vy * bodies[i].mass;
    pz -= bodies[i].vz * bodies[i].mass;
  }
  
  bodies[0].vx = - px / solar_mass;
  bodies[0].vy = - py / solar_mass;
  bodies[0].vz = - pz / solar_mass;
}

#define NBODIES 1024
struct planet bodies[NBODIES] ;

int main(int argc, char ** argv)
{
  int n=10; 
  int i,j;
  int N;double t;
  char c=' ';
  ifstream fin; //naming the input file for the program
	fin.open("bodies.txt");
	if (fin.fail()){
		cout<< "Input file opening failed.\n";
		exit(1);
	}
	fin >> N;
	if(N!=NBODIES){
		printf("wrong number of bodies in file");
		exit(1);
	}
	for(i=0;i<NBODIES;i++){fin >> bodies[i].mass;}
	for(i=0;i<NBODIES;i++){fin >> bodies[i].x;};
	for(i=0;i<NBODIES;i++){fin >> bodies[i].y;};
	for(i=0;i<NBODIES;i++){fin >> bodies[i].z;};
	for(i=0;i<NBODIES;i++){fin >> bodies[i].vx;};
	for(i=0;i<NBODIES;i++){fin >> bodies[i].vy;};
	for(i=0;i<NBODIES;i++){fin >> bodies[i].vz;};
	fin.close();
	offset_momentum(NBODIES, bodies);
	
	printf ("%.9f\n", energy(NBODIES, bodies));
    clock_t start, finish;
    start=clock();
    for (i = 1; i <= n; i++)
		advance(NBODIES, bodies, 0.01);
	finish=clock();
	printf("\n time per iteration %f \n", ((double)(((finish-start)/CLOCKS_PER_SEC))/n));
	printf ("%.9f\n", energy(NBODIES, bodies));
  return 0;
}
