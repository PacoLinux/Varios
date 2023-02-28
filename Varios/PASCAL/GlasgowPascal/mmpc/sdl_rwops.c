//C interface written to connect to SDL_rwops.h for Vector Pascal
//Version 0.1 Ben Watt 5/3/02

#include "SDL_rwops.h"

void accessSDL_RWseek(struct SDL_RWops * ctx, int offset, int whence)
{
  SDL_RWseek(ctx,offset,whence);
}

void accessSDL_RWread(struct SDL_RWops * ctx, void *ptr, int size, int n)
{
  SDL_RWread(ctx,ptr,size,n);
}

void accessSDL_RWwrite(struct SDL_RWops * ctx, void *ptr, int size, int n)
{
  SDL_RWwrite(ctx,ptr,size,n);
}

void accessSDL_RWclose(struct SDL_RWops * ctx)
{
  SDL_RWclose(ctx);
}
