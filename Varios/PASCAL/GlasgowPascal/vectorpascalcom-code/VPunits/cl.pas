{
   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
   MA 02110-1301, USA.
   
}

Unit CL;
{Low level interface to opencl }
{$linklib OpenCL}
Interface
Const maxprop = 100;
Type 
 size_t = int64;
 cl_char = -128..127;
 cl_uchar = 0..255;
 cl_short = short;
 cl_ushort = word;
 cl_int = integer;
 cl_uint = 0..maxint;
 cl_long = int64;
 cl_ulong = 0..maxint64;
 cl_half = word;
 cl_float = real;
 cl_double = double;
 cl_platform_id = pointer;
 cl_device_id = pointer;
 cl_context = pointer;
 cl_command_queue = pointer;
 cl_mem = pointer;
 cl_program = pointer;
 cl_kernel = pointer;
 cl_event = pointer;
 cl_sampler = pointer;
 propertylist = array[1..maxprop] Of int64;
 cl_bool = cl_uint;

(* WARNING! Unlike cl_ types in cl_platform.h, cl_bool is not guaranteed to be the same size as the bool in kernels. *)
 cl_bitfield = int64;
 cl_device_type = cl_bitfield;
 cl_platform_info = cl_uint;
 cl_device_info = cl_uint;
 cl_device_fp_config = cl_bitfield;
 cl_device_mem_cache_type = cl_uint;
 cl_device_local_mem_type = cl_uint;
 cl_device_exec_capabilities = cl_bitfield;
 cl_device_svm_capabilities = cl_bitfield;
 cl_command_queue_properties = cl_bitfield;
 cl_device_partition_property = ^integer;
 cl_device_affinity_domain = cl_bitfield;
 cl_context_properties = int64;
 cl_context_info = cl_uint;
 cl_queue_properties = cl_bitfield;
 cl_command_queue_info = cl_uint;
 cl_channel_order = cl_uint;
 cl_channel_type = cl_uint;
 cl_svm_mem_flags = cl_bitfield;
 cl_mem_object_type = cl_uint;
 cl_mem_info = cl_uint;
 cl_mem_migration_flags = cl_bitfield;
 cl_image_info = cl_uint;
 cl_buffer_create_type = cl_uint;
 cl_addressing_mode = cl_uint;
 cl_filter_mode = cl_uint;
 cl_sampler_info = cl_uint;
 cl_map_flags = cl_uint;
 cl_pipe_properties = ^integer;
 cl_pipe_info = cl_uint;
 cl_program_info = cl_uint;
 cl_program_build_info = cl_uint;
 cl_program_binary_type = cl_uint;
 cl_build_status = cl_int;
 cl_kernel_info = cl_uint;
 cl_kernel_arg_info = cl_uint;
 cl_kernel_arg_address_qualifier = cl_uint;
 cl_kernel_arg_access_qualifier = cl_uint;
 cl_kernel_arg_type_qualifier = cl_bitfield;
 cl_kernel_work_group_info = cl_uint;
 cl_kernel_sub_group_info = cl_uint;
 cl_event_info = cl_uint;
 cl_command_type = cl_uint;
 cl_profiling_info = cl_uint;
 cl_sampler_properties = cl_bitfield;
 cl_kernel_exec_info = cl_uint;
Const 
(* Error Codes *)
 CL_SUCCESS = 0;
 CL_DEVICE_NOT_FOUND = -1;
 CL_DEVICE_NOT_AVAILABLE = -2;
 CL_COMPILER_NOT_AVAILABLE = -3;
 CL_MEM_OBJECT_ALLOCATION_FAILURE = -4;
 CL_OUT_OF_RESOURCES = -5;
 CL_OUT_OF_HOST_MEMORY = -6;
 CL_PROFILING_INFO_NOT_AVAILABLE = -7;
 CL_MEM_COPY_OVERLAP = -8;
 CL_IMAGE_FORMAT_MISMATCH = -9;
 CL_IMAGE_FORMAT_NOT_SUPPORTED = -10;
 CL_BUILD_PROGRAM_FAILURE = -11;
 CL_MAP_FAILURE = -12;
 CL_MISALIGNED_SUB_BUFFER_OFFSET = -13;
 CL_EXEC_STATUS_ERROR_FOR_EVENTS_IN_WAIT_LIST = -14;
 CL_COMPILE_PROGRAM_FAILURE = -15;
 CL_LINKER_NOT_AVAILABLE = -16;
 CL_LINK_PROGRAM_FAILURE = -17;
 CL_DEVICE_PARTITION_FAILED = -18;
 CL_KERNEL_ARG_INFO_NOT_AVAILABLE = -19;
 CL_INVALID_VALUE = -30;
 CL_INVALID_DEVICE_TYPE = -31;
 CL_INVALID_PLATFORM = -32;
 CL_INVALID_DEVICE = -33;
 CL_INVALID_CONTEXT = -34;
 CL_INVALID_QUEUE_PROPERTIES = -35;
 CL_INVALID_COMMAND_QUEUE = -36;
 CL_INVALID_HOST_PTR = -37;
 CL_INVALID_MEM_OBJECT = -38;
 CL_INVALID_IMAGE_FORMAT_DESCRIPTOR = -39;
 CL_INVALID_IMAGE_SIZE = -40;
 CL_INVALID_SAMPLER = -41;
 CL_INVALID_BINARY = -42;
 CL_INVALID_BUILD_OPTIONS = -43;
 CL_INVALID_PROGRAM = -44;
 CL_INVALID_PROGRAM_EXECUTABLE = -45;
 CL_INVALID_KERNEL_NAME = -46;
 CL_INVALID_KERNEL_DEFINITION = -47;
 CL_INVALID_KERNEL = -48;
 CL_INVALID_ARG_INDEX = -49;
 CL_INVALID_ARG_VALUE = -50;
 CL_INVALID_ARG_SIZE = -51;
 CL_INVALID_KERNEL_ARGS = -52;
 CL_INVALID_WORK_DIMENSION = -53;
 CL_INVALID_WORK_GROUP_SIZE = -54;
 CL_INVALID_WORK_ITEM_SIZE = -55;
 CL_INVALID_GLOBAL_OFFSET = -56;
 CL_INVALID_EVENT_WAIT_LIST = -57;
 CL_INVALID_EVENT = -58;
 CL_INVALID_OPERATION = -59;
 CL_INVALID_GL_OBJECT = -60;
 CL_INVALID_BUFFER_SIZE = -61;
 CL_INVALID_MIP_LEVEL = -62;
 CL_INVALID_GLOBAL_WORK_SIZE = -63;
 CL_INVALID_PROPERTY = -64;
 CL_INVALID_IMAGE_DESCRIPTOR = -65;
 CL_INVALID_COMPILER_OPTIONS = -66;
 CL_INVALID_LINKER_OPTIONS = -67;
 CL_INVALID_DEVICE_PARTITION_COUNT = -68;
 CL_INVALID_PIPE_SIZE = -69;
 CL_INVALID_DEVICE_QUEUE = -70;
 CL_INVALID_SPEC_ID = -71;
 CL_MAX_SIZE_RESTRICTION_EXCEEDED = -72;
(* OpenCL Version *)
 CL_VERSION_1_0 = 1;
 CL_VERSION_1_1 = 1;
 CL_VERSION_1_2 = 1;
 CL_VERSION_2_0 = 1;
 CL_VERSION_2_1 = 1;
 CL_VERSION_2_2 = 1;
(* cl_bool *)
 CL_FALSE = 0;
 CL_TRUE = 1;
 CL_BLOCKING = CL_TRUE;
 CL_NON_BLOCKING = CL_FALSE;
(* cl_platform_info *)
 CL_PLATFORM_PROFILE = $0900;
 CL_PLATFORM_VERSION = $0901;
 CL_PLATFORM_NAME = $0902;
 CL_PLATFORM_VENDOR = $0903;
 CL_PLATFORM_EXTENSIONS = $0904;
 CL_PLATFORM_HOST_TIMER_RESOLUTION = $0905;
(* cl_device_type - bitfield *)
 CL_DEVICE_TYPE_DEFAULT = 1;
 CL_DEVICE_TYPE_CPU = 2;
 CL_DEVICE_TYPE_GPU = 4;
 CL_DEVICE_TYPE_ACCELERATOR = 8;
 CL_DEVICE_TYPE_CUSTOM = 16;
 CL_DEVICE_TYPE_ALL = $FFFFFFFF;
(* cl_device_info *)
 CL_DEVICE_TYPE = $1000;
 CL_DEVICE_VENDOR_ID = $1001;
 CL_DEVICE_MAX_COMPUTE_UNITS = $1002;
 CL_DEVICE_MAX_WORK_ITEM_DIMENSIONS = $1003;
 CL_DEVICE_MAX_WORK_GROUP_SIZE = $1004;
 CL_DEVICE_MAX_WORK_ITEM_SIZES = $1005;
 CL_DEVICE_PREFERRED_VECTOR_WIDTH_CHAR = $1006;
 CL_DEVICE_PREFERRED_VECTOR_WIDTH_SHORT = $1007;
 CL_DEVICE_PREFERRED_VECTOR_WIDTH_INT = $1008;
 CL_DEVICE_PREFERRED_VECTOR_WIDTH_LONG = $1009;
 CL_DEVICE_PREFERRED_VECTOR_WIDTH_FLOAT = $100A;
 CL_DEVICE_PREFERRED_VECTOR_WIDTH_DOUBLE = $100B;
 CL_DEVICE_MAX_CLOCK_FREQUENCY = $100C;
 CL_DEVICE_ADDRESS_BITS = $100D;
 CL_DEVICE_MAX_READ_IMAGE_ARGS = $100E;
 CL_DEVICE_MAX_WRITE_IMAGE_ARGS = $100F;
 CL_DEVICE_MAX_MEM_ALLOC_SIZE = $1010;
 CL_DEVICE_IMAGE2D_MAX_WIDTH = $1011;
 CL_DEVICE_IMAGE2D_MAX_HEIGHT = $1012;
 CL_DEVICE_IMAGE3D_MAX_WIDTH = $1013;
 CL_DEVICE_IMAGE3D_MAX_HEIGHT = $1014;
 CL_DEVICE_IMAGE3D_MAX_DEPTH = $1015;
 CL_DEVICE_IMAGE_SUPPORT = $1016;
 CL_DEVICE_MAX_PARAMETER_SIZE = $1017;
 CL_DEVICE_MAX_SAMPLERS = $1018;
 CL_DEVICE_MEM_BASE_ADDR_ALIGN = $1019;
 CL_DEVICE_MIN_DATA_TYPE_ALIGN_SIZE = $101A;
 CL_DEVICE_SINGLE_FP_CONFIG = $101B;
 CL_DEVICE_GLOBAL_MEM_CACHE_TYPE = $101C;
 CL_DEVICE_GLOBAL_MEM_CACHELINE_SIZE = $101D;
 CL_DEVICE_GLOBAL_MEM_CACHE_SIZE = $101E;
 CL_DEVICE_GLOBAL_MEM_SIZE = $101F;
 CL_DEVICE_MAX_CONSTANT_BUFFER_SIZE = $1020;
 CL_DEVICE_MAX_CONSTANT_ARGS = $1021;
 CL_DEVICE_LOCAL_MEM_TYPE = $1022;
 CL_DEVICE_LOCAL_MEM_SIZE = $1023;
 CL_DEVICE_ERROR_CORRECTION_SUPPORT = $1024;
 CL_DEVICE_PROFILING_TIMER_RESOLUTION = $1025;
 CL_DEVICE_ENDIAN_LITTLE = $1026;
 CL_DEVICE_AVAILABLE = $1027;
 CL_DEVICE_COMPILER_AVAILABLE = $1028;
 CL_DEVICE_EXECUTION_CAPABILITIES = $1029;
 CL_DEVICE_QUEUE_PROPERTIES = $102A (* deprecated *);
 CL_DEVICE_QUEUE_ON_HOST_PROPERTIES = $102A;
 CL_DEVICE_NAME = $102B;
 CL_DEVICE_VENDOR = $102C;
 CL_DRIVER_VERSION = $102D;
 CL_DEVICE_PROFILE = $102E;
 CL_DEVICE_VERSION = $102F;
 CL_DEVICE_EXTENSIONS = $1030;
 CL_DEVICE_PLATFORM = $1031;
 CL_DEVICE_DOUBLE_FP_CONFIG = $1032;
 CL_DEVICE_HALF_FP_CONFIG = $1033;
 CL_DEVICE_PREFERRED_VECTOR_WIDTH_HALF = $1034;
 CL_DEVICE_HOST_UNIFIED_MEMORY = $1035 (* deprecated *);
 CL_DEVICE_NATIVE_VECTOR_WIDTH_CHAR = $1036;
 CL_DEVICE_NATIVE_VECTOR_WIDTH_SHORT = $1037;
 CL_DEVICE_NATIVE_VECTOR_WIDTH_INT = $1038;
 CL_DEVICE_NATIVE_VECTOR_WIDTH_LONG = $1039;
 CL_DEVICE_NATIVE_VECTOR_WIDTH_FLOAT = $103A;
 CL_DEVICE_NATIVE_VECTOR_WIDTH_DOUBLE = $103B;
 CL_DEVICE_NATIVE_VECTOR_WIDTH_HALF = $103C;
 CL_DEVICE_OPENCL_C_VERSION = $103D;
 CL_DEVICE_LINKER_AVAILABLE = $103E;
 CL_DEVICE_BUILT_IN_KERNELS = $103F;
 CL_DEVICE_IMAGE_MAX_BUFFER_SIZE = $1040;
 CL_DEVICE_IMAGE_MAX_ARRAY_SIZE = $1041;
 CL_DEVICE_PARENT_DEVICE = $1042;
 CL_DEVICE_PARTITION_MAX_SUB_DEVICES = $1043;
 CL_DEVICE_PARTITION_PROPERTIES = $1044;
 CL_DEVICE_PARTITION_AFFINITY_DOMAIN = $1045;
 CL_DEVICE_PARTITION_TYPE = $1046;
 CL_DEVICE_REFERENCE_COUNT = $1047;
 CL_DEVICE_PREFERRED_INTEROP_USER_SYNC = $1048;
 CL_DEVICE_PRINTF_BUFFER_SIZE = $1049;
 CL_DEVICE_IMAGE_PITCH_ALIGNMENT = $104A;
 CL_DEVICE_IMAGE_BASE_ADDRESS_ALIGNMENT = $104B;
 CL_DEVICE_MAX_READ_WRITE_IMAGE_ARGS = $104C;
 CL_DEVICE_MAX_GLOBAL_VARIABLE_SIZE = $104D;
 CL_DEVICE_QUEUE_ON_DEVICE_PROPERTIES = $104E;
 CL_DEVICE_QUEUE_ON_DEVICE_PREFERRED_SIZE = $104F;
 CL_DEVICE_QUEUE_ON_DEVICE_MAX_SIZE = $1050;
 CL_DEVICE_MAX_ON_DEVICE_QUEUES = $1051;
 CL_DEVICE_MAX_ON_DEVICE_EVENTS = $1052;
 CL_DEVICE_SVM_CAPABILITIES = $1053;
 CL_DEVICE_GLOBAL_VARIABLE_PREFERRED_TOTAL_SIZE = $1054;
 CL_DEVICE_MAX_PIPE_ARGS = $1055;
 CL_DEVICE_PIPE_MAX_ACTIVE_RESERVATIONS = $1056;
 CL_DEVICE_PIPE_MAX_PACKET_SIZE = $1057;
 CL_DEVICE_PREFERRED_PLATFORM_ATOMIC_ALIGNMENT = $1058;
 CL_DEVICE_PREFERRED_GLOBAL_ATOMIC_ALIGNMENT = $1059;
 CL_DEVICE_PREFERRED_LOCAL_ATOMIC_ALIGNMENT = $105A;
 CL_DEVICE_IL_VERSION = $105B;
 CL_DEVICE_MAX_NUM_SUB_GROUPS = $105C;
 CL_DEVICE_SUB_GROUP_INDEPENDENT_FORWARD_PROGRESS = $105D;
(* cl_device_fp_config - bitfield *)
 CL_FP_DENORM = 1 shl 0;
 CL_FP_INF_NAN = 1 shl 1;
 CL_FP_ROUND_TO_NEAREST = 1 shl 2;
 CL_FP_ROUND_TO_ZERO = 1 shl 3;
 CL_FP_ROUND_TO_INF = 1 shl 4;
 CL_FP_FMA = 1 shl 5;
 CL_FP_SOFT_FLOAT = 1 shl 6;
 CL_FP_CORRECTLY_ROUNDED_DIVIDE_SQRT = 1 shl 7;
(* cl_device_mem_cache_type *)
 CL_NONE = $0;
 CL_READ_ONLY_CACHE = $1;
 CL_READ_WRITE_CACHE = $2;
(* cl_device_local_mem_type *)
 CL_LOCAL = $1;
 CL_GLOBAL = $2;
(* cl_device_exec_capabilities - bitfield *)
 CL_EXEC_KERNEL = 1 shl 0;
 CL_EXEC_NATIVE_KERNEL = 1 shl 1;
(* cl_command_queue_properties - bitfield *)
 CL_QUEUE_OUT_OF_ORDER_EXEC_MODE_ENABLE = 1 shl 0;
 CL_QUEUE_PROFILING_ENABLE = 1 shl 1;
 CL_QUEUE_ON_DEVICE = 1 shl 2;
 CL_QUEUE_ON_DEVICE_DEFAULT = 1 shl 3;
(* cl_context_info *)
 CL_CONTEXT_REFERENCE_COUNT = $1080;
 CL_CONTEXT_DEVICES = $1081;
 CL_CONTEXT_PROPERTIES = $1082;
 CL_CONTEXT_NUM_DEVICES = $1083;
(* cl_context_properties *)
 CL_CONTEXT_PLATFORM = $1084;
 CL_CONTEXT_INTEROP_USER_SYNC = $1085;
(* cl_device_partition_property *)
 CL_DEVICE_PARTITION_EQUALLY = $1086;
 CL_DEVICE_PARTITION_BY_COUNTS = $1087;
 CL_DEVICE_PARTITION_BY_COUNTS_LIST_END = $0;
 CL_DEVICE_PARTITION_BY_AFFINITY_DOMAIN = $1088;
(* cl_device_affinity_domain *)
 CL_DEVICE_AFFINITY_DOMAIN_NUMA = 1 shl 0;
 CL_DEVICE_AFFINITY_DOMAIN_L4_CACHE = 1 shl 1;
 CL_DEVICE_AFFINITY_DOMAIN_L3_CACHE = 1 shl 2;
 CL_DEVICE_AFFINITY_DOMAIN_L2_CACHE = 1 shl 3;
 CL_DEVICE_AFFINITY_DOMAIN_L1_CACHE = 1 shl 4;
 CL_DEVICE_AFFINITY_DOMAIN_NEXT_PARTITIONABLE = 1 shl 5;
(* cl_device_svm_capabilities *)
 CL_DEVICE_SVM_COARSE_GRAIN_BUFFER = 1 shl 0;
 CL_DEVICE_SVM_FINE_GRAIN_BUFFER = 1 shl 1;
 CL_DEVICE_SVM_FINE_GRAIN_SYSTEM = 1 shl 2;
 CL_DEVICE_SVM_ATOMICS = 1 shl 3;
(* cl_command_queue_info *)
 CL_QUEUE_CONTEXT = $1090;
 CL_QUEUE_DEVICE = $1091;
 CL_QUEUE_REFERENCE_COUNT = $1092;
 CL_QUEUE_PROPERTIES = $1093;
 CL_QUEUE_SIZE = $1094;
 CL_QUEUE_DEVICE_DEFAULT = $1095;
(* int64 and cl_svm_mem_flags - bitfield *)
 CL_MEM_READ_WRITE = 1;
 CL_MEM_WRITE_ONLY = 2;
 CL_MEM_READ_ONLY = 4;
 CL_MEM_USE_HOST_PTR = 8;
 CL_MEM_ALLOC_HOST_PTR = 16;
 CL_MEM_COPY_HOST_PTR = 32;
(* reserved 1 shl 6) *)
 CL_MEM_HOST_WRITE_ONLY = 1 shl 7;
 CL_MEM_HOST_READ_ONLY = 1 shl 8;
 CL_MEM_HOST_NO_ACCESS = 1 shl 9;
 CL_MEM_SVM_FINE_GRAIN_BUFFER = 1 shl 10 (* used by cl_svm_mem_flags only *);
 CL_MEM_SVM_ATOMICS = 1 shl 11 (* used by cl_svm_mem_flags only *);
 CL_MEM_KERNEL_READ_AND_WRITE = 1 shl 12;
(* cl_mem_migration_flags - bitfield *)
 CL_MIGRATE_MEM_OBJECT_HOST = 1 shl 0;
 CL_MIGRATE_MEM_OBJECT_CONTENT_UNDEFINED = 1 shl 1;
(* cl_channel_order *)
 CL_R = $10B0;
 CL_A = $10B1;
 CL_RG = $10B2;
 CL_RA = $10B3;
 CL_RGB = $10B4;
 CL_RGBA = $10B5;
 CL_BGRA = $10B6;
 CL_ARGB = $10B7;
 CL_INTENSITY = $10B8;
 CL_LUMINANCE = $10B9;
 CL_Rx = $10BA;
 CL_RGx = $10BB;
 CL_RGBx = $10BC;
 CL_DEPTH = $10BD;
 CL_DEPTH_STENCIL = $10BE;
 CL_sRGB = $10BF;
 CL_sRGBx = $10C0;
 CL_sRGBA = $10C1;
 CL_sBGRA = $10C2;
 CL_ABGR = $10C3;
(* cl_channel_type *)
 CL_SNORM_INT8 = $10D0;
 CL_SNORM_INT16 = $10D1;
 CL_UNORM_INT8 = $10D2;
 CL_UNORM_INT16 = $10D3;
 CL_UNORM_SHORT_565 = $10D4;
 CL_UNORM_SHORT_555 = $10D5;
 CL_UNORM_INT_101010 = $10D6;
 CL_SIGNED_INT8 = $10D7;
 CL_SIGNED_INT16 = $10D8;
 CL_SIGNED_INT32 = $10D9;
 CL_UNSIGNED_INT8 = $10DA;
 CL_UNSIGNED_INT16 = $10DB;
 CL_UNSIGNED_INT32 = $10DC;
 CL_HALF_FLOAT = $10DD;
 CL_FLOAT = $10DE;
 CL_UNORM_INT24 = $10DF;
 CL_UNORM_INT_101010_2 = $10E0;
(* cl_mem_object_type *)
 CL_MEM_OBJECT_BUFFER = $10F0;
 CL_MEM_OBJECT_IMAGE2D = $10F1;
 CL_MEM_OBJECT_IMAGE3D = $10F2;
 CL_MEM_OBJECT_IMAGE2D_ARRAY = $10F3;
 CL_MEM_OBJECT_IMAGE1D = $10F4;
 CL_MEM_OBJECT_IMAGE1D_ARRAY = $10F5;
 CL_MEM_OBJECT_IMAGE1D_BUFFER = $10F6;
 CL_MEM_OBJECT_PIPE = $10F7;
(* cl_mem_info *)
 CL_MEM_TYPE = $1100;
 CL_MEM_FLAGS = $1101;
 CL_MEM_SIZE = $1102;
 CL_MEM_HOST_PTR = $1103;
 CL_MEM_MAP_COUNT = $1104;
 CL_MEM_REFERENCE_COUNT = $1105;
 CL_MEM_CONTEXT = $1106;
 CL_MEM_ASSOCIATED_MEMOBJECT = $1107;
 CL_MEM_OFFSET = $1108;
 CL_MEM_USES_SVM_POINTER = $1109;
(* cl_image_info *)
 CL_IMAGE_FORMAT = $1110;
 CL_IMAGE_ELEMENT_SIZE = $1111;
 CL_IMAGE_ROW_PITCH = $1112;
 CL_IMAGE_SLICE_PITCH = $1113;
 CL_IMAGE_WIDTH = $1114;
 CL_IMAGE_HEIGHT = $1115;
 CL_IMAGE_DEPTH = $1116;
 CL_IMAGE_ARRAY_SIZE = $1117;
 CL_IMAGE_BUFFER = $1118;
 CL_IMAGE_NUM_MIP_LEVELS = $1119;
 CL_IMAGE_NUM_SAMPLES = $111A;
(* cl_pipe_info *)
 CL_PIPE_PACKET_SIZE = $1120;
 CL_PIPE_MAX_PACKETS = $1121;
(* cl_addressing_mode *)
 CL_ADDRESS_NONE = $1130;
 CL_ADDRESS_CLAMP_TO_EDGE = $1131;
 CL_ADDRESS_CLAMP = $1132;
 CL_ADDRESS_REPEAT = $1133;
 CL_ADDRESS_MIRRORED_REPEAT = $1134;
(* cl_filter_mode *)
 CL_FILTER_NEAREST = $1140;
 CL_FILTER_LINEAR = $1141;
(* cl_sampler_info *)
 CL_SAMPLER_REFERENCE_COUNT = $1150;
 CL_SAMPLER_CONTEXT = $1151;
 CL_SAMPLER_NORMALIZED_COORDS = $1152;
 CL_SAMPLER_ADDRESSING_MODE = $1153;
 CL_SAMPLER_FILTER_MODE = $1154;
 CL_SAMPLER_MIP_FILTER_MODE = $1155;
 CL_SAMPLER_LOD_MIN = $1156;
 CL_SAMPLER_LOD_MAX = $1157;
(* cl_map_flags - bitfield *)
 CL_MAP_READ = 1 shl 0;
 CL_MAP_WRITE = 1 shl 1;
 CL_MAP_WRITE_INVALIDATE_REGION = 1 shl 2;
(* cl_program_info *)
 CL_PROGRAM_REFERENCE_COUNT = $1160;
 CL_PROGRAM_CONTEXT = $1161;
 CL_PROGRAM_NUM_DEVICES = $1162;
 CL_PROGRAM_DEVICES = $1163;
 CL_PROGRAM_SOURCE = $1164;
 CL_PROGRAM_BINARY_SIZES = $1165;
 CL_PROGRAM_BINARIES = $1166;
 CL_PROGRAM_NUM_KERNELS = $1167;
 CL_PROGRAM_KERNEL_NAMES = $1168;
 CL_PROGRAM_IL = $1169;
 CL_PROGRAM_SCOPE_GLOBAL_CTORS_PRESENT = $116A;
 CL_PROGRAM_SCOPE_GLOBAL_DTORS_PRESENT = $116B;
(* cl_program_build_info *)
 CL_PROGRAM_BUILD_STATUS = $1181;
 CL_PROGRAM_BUILD_OPTIONS = $1182;
 CL_PROGRAM_BUILD_LOG = $1183;
 CL_PROGRAM_BINARY_TYPE = $1184;
 CL_PROGRAM_BUILD_GLOBAL_VarIABLE_TOTAL_SIZE = $1185;
(* cl_program_binary_type *)
 CL_PROGRAM_BINARY_TYPE_NONE = $0;
 CL_PROGRAM_BINARY_TYPE_COMPILED_OBJECT = $1;
 CL_PROGRAM_BINARY_TYPE_LIBRARY = $2;
 CL_PROGRAM_BINARY_TYPE_EXECUTABLE = $4;
(* cl_build_status *)
 CL_BUILD_SUCCESS = 0;
 CL_BUILD_NONE = -1;
 CL_BUILD_ERROR = -2;
 CL_BUILD_IN_PROGRESS = -3;
(* cl_kernel_info *)
 CL_KERNEL_FUNCTION_NAME = $1190;
 CL_KERNEL_NUM_ARGS = $1191;
 CL_KERNEL_REFERENCE_COUNT = $1192;
 CL_KERNEL_CONTEXT = $1193;
 CL_KERNEL_PROGRAM = $1194;
 CL_KERNEL_ATTRIBUTES = $1195;
 CL_KERNEL_MAX_NUM_SUB_GROUPS = $11B9;
 CL_KERNEL_COMPILE_NUM_SUB_GROUPS = $11BA;
(* cl_kernel_arg_info *)
 CL_KERNEL_ARG_ADDRESS_QUALIFIER = $1196;
 CL_KERNEL_ARG_ACCESS_QUALIFIER = $1197;
 CL_KERNEL_ARG_TYPE_NAME = $1198;
 CL_KERNEL_ARG_TYPE_QUALIFIER = $1199;
 CL_KERNEL_ARG_NAME = $119A;
(* cl_kernel_arg_address_qualifier *)
 CL_KERNEL_ARG_ADDRESS_GLOBAL = $119B;
 CL_KERNEL_ARG_ADDRESS_LOCAL = $119C;
 CL_KERNEL_ARG_ADDRESS_CONSTANT = $119D;
 CL_KERNEL_ARG_ADDRESS_PRIVATE = $119E;
(* cl_kernel_arg_access_qualifier *)
 CL_KERNEL_ARG_ACCESS_READ_ONLY = $11A0;
 CL_KERNEL_ARG_ACCESS_WRITE_ONLY = $11A1;
 CL_KERNEL_ARG_ACCESS_READ_WRITE = $11A2;
 CL_KERNEL_ARG_ACCESS_NONE = $11A3;
(* cl_kernel_arg_type_qualifier *)
 CL_KERNEL_ARG_TYPE_NONE = 0;
 CL_KERNEL_ARG_TYPE_CONST = 1 shl 0;
 CL_KERNEL_ARG_TYPE_RESTRICT = 1 shl 1;
 CL_KERNEL_ARG_TYPE_VOLATILE = 1 shl 2;
 CL_KERNEL_ARG_TYPE_PIPE = 1 shl 3;
(* cl_kernel_work_group_info *)
 CL_KERNEL_WORK_GROUP_SIZE = $11B0;
 CL_KERNEL_COMPILE_WORK_GROUP_SIZE = $11B1;
 CL_KERNEL_LOCAL_MEM_SIZE = $11B2;
 CL_KERNEL_PREFERRED_WORK_GROUP_SIZE_MULTIPLE = $11B3;
 CL_KERNEL_PRIVATE_MEM_SIZE = $11B4;
 CL_KERNEL_GLOBAL_WORK_SIZE = $11B5;
(* cl_kernel_sub_group_info *)
 CL_KERNEL_MAX_SUB_GROUP_SIZE_FOR_NDRANGE = $2033;
 CL_KERNEL_SUB_GROUP_COUNT_FOR_NDRANGE = $2034;
 CL_KERNEL_LOCAL_SIZE_FOR_SUB_GROUP_COUNT = $11B8;
(* cl_kernel_exec_info *)
 CL_KERNEL_EXEC_INFO_SVM_PTRS = $11B6;
 CL_KERNEL_EXEC_INFO_SVM_FINE_GRAIN_SYSTEM = $11B7;
(* cl_event_info *)
 CL_EVENT_COMMAND_QUEUE = $11D0;
 CL_EVENT_COMMAND_TYPE = $11D1;
 CL_EVENT_REFERENCE_COUNT = $11D2;
 CL_EVENT_COMMAND_EXECUTION_STATUS = $11D3;
 CL_EVENT_CONTEXT = $11D4;
(* cl_command_type *)
 CL_COMMAND_NDRANGE_KERNEL = $11F0;
 CL_COMMAND_TASK = $11F1;
 CL_COMMAND_NATIVE_KERNEL = $11F2;
 CL_COMMAND_READ_BUFFER = $11F3;
 CL_COMMAND_WRITE_BUFFER = $11F4;
 CL_COMMAND_COPY_BUFFER = $11F5;
 CL_COMMAND_READ_IMAGE = $11F6;
 CL_COMMAND_WRITE_IMAGE = $11F7;
 CL_COMMAND_COPY_IMAGE = $11F8;
 CL_COMMAND_COPY_IMAGE_TO_BUFFER = $11F9;
 CL_COMMAND_COPY_BUFFER_TO_IMAGE = $11FA;
 CL_COMMAND_MAP_BUFFER = $11FB;
 CL_COMMAND_MAP_IMAGE = $11FC;
 CL_COMMAND_UNMAP_MEM_OBJECT = $11FD;
 CL_COMMAND_MARKER = $11FE;
 CL_COMMAND_ACQUIRE_GL_OBJECTS = $11FF;
 CL_COMMAND_RELEASE_GL_OBJECTS = $1200;
 CL_COMMAND_READ_BUFFER_RECT = $1201;
 CL_COMMAND_WRITE_BUFFER_RECT = $1202;
 CL_COMMAND_COPY_BUFFER_RECT = $1203;
 CL_COMMAND_USER = $1204;
 CL_COMMAND_BARRIER = $1205;
 CL_COMMAND_MIGRATE_MEM_OBJECTS = $1206;
 CL_COMMAND_FILL_BUFFER = $1207;
 CL_COMMAND_FILL_IMAGE = $1208;
 CL_COMMAND_SVM_FREE = $1209;
 CL_COMMAND_SVM_MEMCPY = $120A;
 CL_COMMAND_SVM_MEMFILL = $120B;
 CL_COMMAND_SVM_MAP = $120C;
 CL_COMMAND_SVM_UNMAP = $120D;
(* command execution status *)
 CL_COMPLETE = $0;
 CL_RUNNING = $1;
 CL_SUBMITTED = $2;
 CL_QUEUED = $3;
(* cl_buffer_create_type *)
 CL_BUFFER_CREATE_TYPE_REGION = $1220;
(* cl_profiling_info *)
 CL_PROFILING_COMMAND_QUEUED = $1280;
 CL_PROFILING_COMMAND_SUBMIT = $1281;
 CL_PROFILING_COMMAND_START = $1282;
 CL_PROFILING_COMMAND_END = $1283;
 CL_PROFILING_COMMAND_COMPLETE = $1284;
 (* Platform API *)
 cl_maxplatform = 32;
 cl_maxdevice = 32;
Type cl_platform_id_array = array[1..cl_maxplatform] Of cl_platform_id ;
 cl_device_id_array = array[1..cl_maxdevice] Of cl_device_id;
Function clGetPlatformIDs (num_entries:cl_uint ;
 platforms: ^cl_platform_id_array;
 Var num_platforms:cl_uint ) : cl_int;
external name 'clGetPlatformIDs' ;
Function clGetPlatformInfo ( platform : cl_platform_id ;
 param_name  :  cl_platform_info ;
 param_value_size : size_t
 ;
 Var param_value : pointer ;
 Var param_value_size_ret : size_t ) : cl_int;
external name 'clGetPlatformInfo' ;
(* Device APIs *)
Function clGetDeviceIDs ( platform : cl_platform_id ;
 device_type : int64;
 num_entries : cl_uint ;
 devices : ^cl_device_id_array ;
 Var num_devices : cl_uint ) : cl_int;
external name 'clGetDeviceIDs';
Function clGetDeviceInfo ( device : cl_device_id ;
 param_name  :  cl_device_info ;
 param_value_size : size_t ;
 Var param_value : pointer ;
 Var param_value_size_ret : size_t ) : cl_int;
external name 'clGetDeviceInfo';
Function clCreateSubDevices ( in_device : cl_device_id ;
 Var properties  :  cl_device_partition_property ;
 num_devices  :  cl_uint ;
 Var out_devices : cl_device_id ;
 Var num_devices_ret : cl_uint ) : cl_int;
external name 'clCreateSubDevices';
Function clRetainDevice ( device : cl_device_id ) : cl_int;
external name 'clRetainDevice';
Function clReleaseDevice ( device : cl_device_id ) : cl_int;
external name 'clReleaseDevice';
Function clSetDefaultDeviceCommandQueue ( context : cl_context ;
  device : cl_device_id ;
  command_queue : cl_command_queue ) : cl_int;
external name 'clSetDefaultDeviceCommandQueue';
Function clGetDeviceAndHostTimer ( device : cl_device_id ;
  Var  device_timestamp : cl_ulong ;
  Var  host_timestamp : cl_ulong ) : cl_int;
external name 'clGetDeviceAndHostTimer';
Function clGetHostTimer ( device : cl_device_id ;
 Var host_timestamp  :  cl_ulong ) : cl_int;
external name 'clGetHostTimer';
(* Context APIs *)
Function clCreateContext( properties : ^propertylist;
 num_devices : cl_uint ;
 Var devices : cl_device_id ;
 pfn_notify:Procedure(
 Var p1:  byte;
 p2:pointer;
 p3:size_t;
 p4:pointer);
{ void (CL_CALLBACK * (* pfn_notify*) )(const char *, const void *, size_t, void *),}
user_data : pointer ;
Var errcode_ret : cl_int ) : cl_context;
 external name 'clCreateContext';
Function clCreateContextFromType(
  Var properties : propertylist ;
  device_type : int64 ;
  pfn_notify :   Procedure(
  Var p1:  byte;
  p2:pointer;
  p3:size_t;
  p4:pointer);
{ void (CL_CALLBACK * (* pfn_notify*) )(const char *, const void *, size_t, void *),}
Var user_data : pointer ;
Var errcode_ret : cl_int ) : cl_context;
 external name 'clCreateContextFromType';
Function clRetainContext ( context : cl_context ) : cl_int;
external name 'clRetainContext';
Function clReleaseContext ( context : cl_context ) : cl_int;
external name 'clReleaseContext';
Function clGetContextInfo ( context : cl_context ;
 param_name  :  cl_context_info ;
 param_value_size : size_t ;
 Var param_value : pointer ;
 Var param_value_size_ret : size_t ) : cl_int;
external name 'clGetContextInfo';
(* Command Queue APIs *)
Function clCreateCommandQueueWithProperties ( context : cl_context ;
  device : cl_device_id ;
  properties : ^propertylist;
  Var errcode_ret : cl_int ) : cl_command_queue;
external name 'clCreateCommandQueueWithProperties' ;
Function clRetainCommandQueue ( command_queue : cl_command_queue ) : cl_int;
external name 'clRetainCommandQueue';
Function clReleaseCommandQueue ( command_queue : cl_command_queue ) : cl_int;
external name 'clReleaseCommandQueue';
Function clGetCommandQueueInfo ( command_queue : cl_command_queue ;
 param_name : cl_command_queue_info ;
 param_value_size : size_t ;
 Var  param_value : pointer ;
 Var  param_value_size_ret : size_t ) : cl_int;
external name 'clGetCommandQueueInfo';
(* Memory Object APIs *)
Function clCreateBuffer ( context : cl_context ;
 flags : int64;
 size : size_t ;
   host_ptr : pointer ;
 Var errcode_ret : cl_int ) : cl_int;
external name 'clCreateBuffer';
Function clCreateSubBuffer ( buffer : cl_mem ;
 flags : int64 ;
 buffer_create_type : cl_buffer_create_type ;
 Var buffer_create_info : pointer ;
 Var errcode_ret : cl_int ) : cl_mem;
external name 'clCreateSubBuffer';
Type cl_image_format = Record
 image_channel_order : cl_channel_order;
 image_channel_data_type : cl_channel_type;
End;
Type cl_image_desc = Record
 image_type : cl_mem_object_type ;
 image_width : size_t ;
 image_height : size_t ;
 image_depth : size_t ;
 image_array_size : size_t ;
 image_row_pitch : size_t ;
 image_slice_pitch : size_t ;
 num_mip_levels : cl_uint ;
 num_samples : cl_uint ;
 Case boolean Of 
 true : (buffer: cl_mem ) ;
 false : (mem_object: cl_mem ) ;
End;
Function clCreateImage ( context : cl_context ;
 flags : int64 ;
 Var image_format : cl_image_format ;
 Var image_desc  :  cl_image_desc ;
 Var host_ptr : pointer ;
 Var errcode_ret : cl_int ) : cl_mem;
external name 'clCreateImage';
Function clCreatePipe ( context : cl_context ;
 flags : int64 ;
 pipe_packet_size : cl_uint ;
 pipe_max_packets : cl_uint
 ;
 Var properties : cl_pipe_properties ;
 Var errcode_ret : cl_int ) : cl_mem;
external name 'clCreatePipe';
Function clRetainMemObject ( memobj : cl_mem ) : cl_int;
external name 'clRetainMemObject';
Function clReleaseMemObject ( memobj : cl_mem ) : cl_int;
external name 'clReleaseMemObject';
Function clGetSupportedImageFormats ( context : cl_context ;
  flags : int64 ;
  image_type  :   cl_mem_object_type ;
  num_entries : cl_uint ;
  Var  image_formats : cl_image_format ;
  Var num_image_formats : cl_uint ) : cl_int;
external name 'clGetSupportedImageFormats';
Function clGetMemObjectInfo ( memobj : cl_mem ;
 param_name : cl_mem_info
 ;
 param_value_size : size_t ;
 Var param_value : pointer ;
 Var param_value_size_ret : size_t ) : cl_int;
external name 'clGetMemObjectInfo';
Function clGetImageInfo ( image : cl_mem ;
 param_name : cl_image_info ;
 param_value_size : size_t ;
 Var param_value  :  pointer ;
 Var param_value_size_ret : size_t )  :   cl_int
;
external name 'clGetImageInfo';
Function clGetPipeInfo ( pipe : cl_mem ;
 param_name : cl_pipe_info ;
 param_value_size : size_t ;
 Var param_value : pointer
 ;
 Var param_value_size_ret : size_t ) : cl_int;
external name 'clGetPipeInfo';
Function clSetMemObjectDestructorCallback( memobj : cl_mem ;
  pfn_notify:Procedure( memobj : cl_mem ;
  user_data  :   pointer );
user_data : pointer ) : cl_int;
external name 'clSetMemObjectDestructorCallback';
(* SVM Allocation APIs *)
Function clSVMAlloc ( context : cl_context ;
 flags : cl_svm_mem_flags ;
 size : size_t ;
 alignment : cl_uint ) : pointer;
external name 'clSVMAlloc';
Procedure clSVMFree( context : cl_context ;
 Var svm_pointer : pointer) ;
external name 'clSVMFree';
(* Sampler APIs *)
Function clCreateSamplerWithProperties ( context : cl_context ;
  Var normalized_coords : cl_sampler_properties ;
  Var errcode_ret : cl_int ) : cl_sampler;
external name 'clCreateSamplerWithProperties';
Function clRetainSampler ( sampler : cl_sampler ) : cl_int;
external name 'clRetainSampler';
Function clReleaseSampler ( sampler : cl_sampler ) : cl_int;
external name 'clReleaseSampler';
Function clGetSamplerInfo ( sampler : cl_sampler ;
 param_name  :  cl_sampler_info ;
 param_value_size : size_t ;
 Var param_value : pointer ;
 Var param_value_size_ret : size_t ) : cl_int;
external name 'clGetSamplerInfo';
(*theProgram Object APIs *)
Function clCreateProgramWithSource ( context : cl_context ;
  count  : cl_uint ;
  Var strings : ^byte ;
  Var lengths : size_t ;
  Var errcode_ret : cl_int ) : cl_program;
external name 'clCreateProgramWithSource';
Function clCreateProgramWithBinary ( context : cl_context ;
  num_devices : cl_uint ;
  Var  device_list : cl_device_id ;
  Var lengths : size_t ;
  Var  binaries : ^ byte ;
  Var  binary_status : cl_int ;
  Var  errcode_ret : cl_int ) : cl_program;
external name 'clCreateProgramWithBinary';
Function clCreateProgramWithBuiltInKernels ( context : cl_context ;
  num_devices : cl_uint ;
  Var device_list : cl_device_id ;
  Var kernel_names : byte ;
  Var errcode_ret : cl_int ) : cl_program;
external name 'clCreateProgramWithBuiltInKernels';
Function clCreateProgramWithIL ( context : cl_context ;
 Var il  :  pointer ;
 length : size_t ;
 Var errcode_ret : cl_int ) : cl_program;
external name 'clCreateProgramWithIL';
Function clRetainProgram ( theProgram : cl_program ) : cl_program;
external name 'clRetainProgram';
Function clReleaseProgram ( theProgram : cl_program ) : cl_program;
external name 'clReleaseProgram';
Function clBuildProgram( theProgram : cl_program ;
 num_devices : cl_uint ;
 Var device_list : cl_device_id ;
 options :   ^byte ;
 pfn_notify :Procedure( theProgram : cl_program ;user_data:pointer);
user_data : pointer ) : cl_int;
external name 'clBuildProgram';
Function clCompileProgram ( theProgram : cl_program ;
 num_devices : cl_uint
 ;
 Var device_list : cl_device_id ;
 Var options :   byte ;
 num_input_headers : cl_uint
 ;
 Var input_headers : cl_program ;
 Var header_include_names : ^   byte ;
 pfn_notify  :  Procedure( theProgram : cl_program ;
 user_data:pointer);
user_data : pointer ) : cl_int;
external name 'clCompileProgram';
Function clLinkProgram( context : cl_context ;
 num_devices : cl_uint ;
 Var device_list : cl_device_id ;
 Var options :   byte ;
 num_input_programs : cl_uint ;
 Var input_programs  :  cl_program ;
 pfn_notify :Procedure( theProgram  :  cl_program ;
 user_data : pointer ) ;
user_data : pointer ;
Var errcode_ret : cl_int ) : cl_program;
 external name 'clLinkProgram';
Function clSetProgramReleaseCallback( theProgram : cl_program ;
  pfn_notify :Procedure( theProgram : cl_program ;
  user_data : pointer ) ;
user_data : pointer ) : cl_int;
external name 'clSetProgramReleaseCallback';
Function clSetProgramSpecializationConstant ( theProgram : cl_program ;
  spec_id : cl_uint ;
  spec_size : size_t ;
  spec_value: pointer ) : cl_int;
external name 'clSetProgramSpecializationConstant';
Function clUnloadPlatformCompiler ( platform : cl_platform_id ) : cl_int;
external name 'clUnloadPlatformCompiler';
Function clGetProgramInfo ( theProgram : cl_program ;
 param_name  :  cl_program_info ;
 param_value_size : size_t ;
 Var param_value : pointer ;
 Var param_value_size_ret : size_t ) : cl_int;
external name 'clGetProgramInfo';
Function clGetProgramBuildInfo (theProgram : cl_program ;
 device  :  cl_device_id ;
 param_name  :  cl_program_build_info ;
 param_value_size : size_t ;
 Var  param_value : pointer ;
 Var  param_value_size_ret : size_t ) : cl_int;
external name 'clGetProgramBuildInfo';
(* Kernel Object APIs *)
Function clCreateKernel(theProgram : cl_program ;
 Var kernel_name :   byte ;
 Var errcode_ret : cl_int ) : cl_kernel;
external name 'clCreateKernel';
Function clCreateKernelsInProgram (theProgram : cl_program ;
  num_kernels : cl_uint ;
  Var  kernels : cl_kernel ;
  Var  num_kernels_ret : cl_uint ) : cl_int;
external name 'clCreateKernelsInProgram';
Function 
clCloneKernel( source_kernel : cl_kernel ;
 Var errcode_ret :cl_int ) : cl_kernel;
external name 'clCloneKernel';
Function clRetainKernel ( kernel : cl_kernel ) : cl_int;
external name 'clRetainKernel';
Function clReleaseKernel ( kernel : cl_kernel ) : cl_int;
external name 'clReleaseKernel';
Function clSetKernelArg ( kernel : cl_kernel ;
 arg_index : cl_uint ;
 arg_size : size_t ;
Var  arg_value   ) : cl_int;
external name 'clSetKernelArg';
Function clSetKernelArgSVMPointer ( kernel : cl_kernel ;
  arg_index
  : cl_uint ;
  arg_value : pointer
) : cl_int;
external name 'clSetKernelArgSVMPointer';
Function clSetKernelExecInfo ( kernel : cl_kernel ;
 param_name  :  cl_kernel_exec_info ;
 param_value_size  :  size_t ;
 arg_value : pointer) : cl_int;
external name 'clSetKernelExecInfo';
Function clGetKernelInfo ( kernel : cl_kernel ;
 param_name : cl_kernel_info
 ;
 param_value_size : size_t ;
 Var param_value : pointer ;
 Var param_value_size_ret : size_t ) : cl_int;
external name 'clGetKernelInfo';
Function clGetKernelArgInfo ( kernel : cl_kernel ;
 arg_indx : cl_uint ;
 param_name : cl_kernel_arg_info ;
 param_value_size : size_t ;
 Var param_value
 : pointer ;
 Var param_value_size_ret  :  size_t ) : cl_int;
external name 'clGetKernelArgInfo';
Function clGetKernelWorkGroupInfo ( kernel : cl_kernel ;
  device  :   cl_device_id ;
  param_name  :   cl_kernel_work_group_info ;
  param_value_size : size_t ;
  Var  param_value : pointer ;
  Var  param_value_size_ret : size_t ) : cl_int;
external name 'clGetKernelWorkGroupInfo';
Function clGetKernelSubGroupInfo( kernel : cl_kernel ;
  device  :   cl_device_id ;
  param_name  :   cl_kernel_sub_group_info ;
  input_value_size : size_t ;
  Var  input_value : pointer ;
  param_value_size : size_t ;
  Var  param_value : pointer ;
  Var  param_value_size_ret : size_t
 (* param_value_size_ret *) ) : cl_int;
external name 'clGetKernelSubGroupInfo';
(* Event Object APIs *)
Function clWaitForEvents ( num_events : cl_uint ;
 Var event_list : cl_event
) : cl_int;
external name 'clWaitForEvents';
Function clGetEventInfo ( event : cl_event ;
 param_name : cl_event_info ;
 param_value_size : size_t ;
 Var param_value  :  pointer ;
 Var param_value_size_ret : size_t )  :   cl_int
;
external name 'clGetEventInfo';
Function clCreateUserEvent ( context : cl_context ;
 Var errcode_ret  :  cl_int ) : cl_event;
external name 'clCreateUserEvent';
Function clRetainEvent ( event : cl_event ) : cl_int;
external name 'clRetainEvent';
Function clReleaseEvent ( event : cl_event ) : cl_int;
external name 'clReleaseEvent';
Function clSetUserEventStatus ( event : cl_event ;
 execution_status  :  cl_int ) : cl_int;
external name 'clSetUserEventStatus';
Function clSetEventCallback( event : cl_event ;
 command_exec_callback_type : cl_int ;
 pfn_notify : Procedure (p1:cl_event;
 p2: cl_int;
 p3:pointer);
user_data : pointer ) : cl_int;
external name 'clSetEventCallback';
(* Profiling APIs *)
Function clGetEventProfilingInfo ( event : cl_event ;
  param_name  :   cl_profiling_info ;
  param_value_size : size_t ;
  Var  param_value : pointer ;
  Var  param_value_size_ret : size_t ) : cl_int;
external name 'clGetEventProfilingInfo';
(* Flush and Finish APIs *)
Function clFlush ( command_queue : cl_command_queue ) : cl_int;
external name 'clFlush';
Function clFinish ( command_queue : cl_command_queue ) : cl_int;
external name 'clFinish';
(* Enqueued Commands APIs *)
Function clEnqueueReadBuffer ( command_queue : cl_command_queue ;
 buffer
 : cl_mem ;
 blocking_read : cl_bool ;
 offset : size_t ;
 size : size_t ;
  ptr :pointer ;
 num_events_in_wait_list : cl_uint ;
 event_wait_list : ^cl_event ;
 event  :  ^cl_event ) : cl_int;
external name 'clEnqueueReadBuffer';
Function clEnqueueReadBufferRect ( command_queue : cl_command_queue ;
  buffer : cl_mem ;
  blocking_read  :   cl_bool ;
  Var buffer_offset  :   size_t ;
  Var host_offset : size_t
  ;
  Var region : size_t ;
  buffer_row_pitch : size_t ;
  buffer_slice_pitch : size_t ;
  host_row_pitch : size_t ;
  host_slice_pitch : size_t ;
  Var  ptr : pointer ;
  num_events_in_wait_list : cl_uint ;
  event_wait_list : ^cl_event ;
  event : ^cl_event ) : cl_int;
external name 'clEnqueueReadBufferRect';
Function clEnqueueWriteBuffer ( command_queue : cl_command_queue ;
 buffer : cl_mem ;
 blocking_write  :  cl_bool ;
 offset : size_t ;
 size : size_t ;
 ptr:pointer  ;
 num_events_in_wait_list : cl_uint ;
 event_wait_list : ^cl_event ;
 event  :  ^cl_event ) : cl_int;
external name 'clEnqueueWriteBuffer';
Function clEnqueueWriteBufferRect ( command_queue : cl_command_queue ;
  buffer : cl_mem ;
  blocking_write
  : cl_bool ;
  Var buffer_offset  :   size_t ;
  Var host_offset  :   size_t ;
  Var region : size_t ;
  buffer_row_pitch : size_t ;
  buffer_slice_pitch : size_t ;
  host_row_pitch : size_t ;
  host_slice_pitch : size_t ;
  Var  ptr : pointer ;
  num_events_in_wait_list : cl_uint ;
  event_wait_list : ^cl_event ;
  event : ^cl_event ) : cl_int;
external name 'clEnqueueWriteBufferRect';
Function clEnqueueFillBuffer ( command_queue : cl_command_queue ;
 buffer
 : cl_mem ;
 Var pattern : pointer ;
 pattern_size : size_t ;
 offset : size_t ;
 size : size_t ;
 num_events_in_wait_list  :  cl_uint ;
 Var event_wait_list : cl_event ;
 event : ^cl_event ) : cl_int;
external name 'clEnqueueFillBuffer';
Function clEnqueueCopyBuffer ( command_queue : cl_command_queue ;
 src_buffer : cl_mem ;
 dst_buffer : cl_mem
 ;
 src_offset : size_t ;
 dst_offset : size_t ;
 size : size_t ;
 num_events_in_wait_list : cl_uint ;
 event_wait_list : ^cl_event ;
 event  :  ^cl_event ) : cl_int;
external name 'clEnqueueCopyBuffer';
Function clEnqueueCopyBufferRect ( command_queue : cl_command_queue ;
  src_buffer : cl_mem ;
  dst_buffer  :   cl_mem ;
  Var src_origin : size_t ;
  Var dst_origin : size_t ;
  Var  region : size_t ;
  src_row_pitch  :   size_t ;
  src_slice_pitch : size_t
  ;
  dst_row_pitch : size_t ;
  dst_slice_pitch : size_t ;
  num_events_in_wait_list : cl_uint ;
  Var event_wait_list : cl_event ;
  Var event : cl_event ) : cl_int;
external name 'clEnqueueCopyBufferRect';
Function clEnqueueReadImage ( command_queue : cl_command_queue ;
 image  :  cl_mem ;
 blocking_read : cl_bool ;
 Var origin : Array[1..3] Of size_t ;
 Var region :Array[1..3] Of size_t ;
 row_pitch  :  size_t ;
 slice_pitch : size_t ;
 Var ptr : pointer ;
 num_events_in_wait_list
 : cl_uint ;
 Var event_wait_list : cl_event ;
 Var event : cl_event ) : cl_int;
external name 'clEnqueueReadImage';
Function clEnqueueWriteImage ( command_queue : cl_command_queue ;
 image
 : cl_mem ;
 blocking_write : cl_bool ;
 Var origin : Array[1..3] Of size_t ;
 Var region : Array[1..3] Of size_t ;
 input_row_pitch : size_t ;
 input_slice_pitch : size_t ;
 Var ptr  :  pointer ;
 num_events_in_wait_list  :  cl_uint ;
 Var event_wait_list : cl_event ;
 Var event : cl_event ) : cl_int;
external name 'clEnqueueWriteImage';
Function clEnqueueFillImage ( command_queue : cl_command_queue ;
 image  :  cl_mem ;
 Var fill_color : pointer ;
 Var origin :Array[1..3] Of size_t;
 Var region :Array[1..3] Of size_t;
 num_events_in_wait_list : cl_uint ;
 Var event_wait_list : cl_event ;
 Var event  :  cl_event ) : cl_int;
external name 'clEnqueueFillImage';
Function clEnqueueCopyImage ( command_queue : cl_command_queue ;
 src_image : cl_mem ;
 dst_image : cl_mem ;
 Var src_origin :Array[1..3] Of size_t;
 Var dst_origin :Array[1..3] Of size_t;
 Var region :Array[1..3] Of size_t;
 num_events_in_wait_list : cl_uint ;
 Var event_wait_list : cl_event ;
 Var event  :  cl_event ) : cl_int;
external name 'clEnqueueCopyImage';
Function clEnqueueCopyImageToBuffer ( command_queue : cl_command_queue ;
  src_image : cl_mem ;
  dst_buffer : cl_mem ;
  Var  src_origin :Array[1..3] Of size_t;
  Var region :Array[1..3] Of size_t;
  dst_offset : size_t ;
  num_events_in_wait_list : cl_uint ;
  Var event_wait_list : cl_event ;
  Var event : cl_event ) : cl_int;
external name 'clEnqueueCopyImageToBuffer';
Function clEnqueueCopyBufferToImage ( command_queue : cl_command_queue ;
  src_buffer : cl_mem ;
  dst_image : cl_mem ;
  src_offset : size_t ;
  Var  dst_origin :Array[1..3] Of size_t;
  Var region :Array[1..3] Of size_t;
  num_events_in_wait_list : cl_uint ;
  Var event_wait_list : cl_event ;
  Var event : cl_event ) : cl_int;
external name 'clEnqueueCopyBufferToImage';
Function clEnqueueMapBuffer( command_queue : cl_command_queue ;
 buffer : cl_mem ;
 blocking_map : cl_bool ;
 map_flags : cl_map_flags ;
 offset : size_t ;
 size : size_t ;
 num_events_in_wait_list : cl_uint ;
 Var event_wait_list  :  cl_event ;
 Var event : cl_event ;
 Var errcode_ret : cl_int ) : pointer;
external name 'clEnqueueMapBuffer';
Function clEnqueueMapImage( command_queue : cl_command_queue ;
 image : cl_mem ;
 blocking_map : cl_bool ;
 map_flags : cl_map_flags ;
 Var origin :Array[1..3] Of size_t;
 Var region :Array[1..
 3] Of
 size_t;
 Var image_row_pitch : size_t ;
 Var image_slice_pitch : size_t ;
 num_events_in_wait_list  :  cl_uint ;
 Var event_wait_list : cl_event ;
 Var event : cl_event ;
 Var errcode_ret : cl_int ) : pointer;
external name 'clEnqueueMapImage';
Function clEnqueueUnmapMemObject ( command_queue : cl_command_queue ;
  memobj : cl_mem ;
  Var mapped_ptr  :   pointer ;
  num_events_in_wait_list
  : cl_uint ;
  Var event_wait_list  :   cl_event ;
  Var event : cl_event )
: cl_int;
external name 'clEnqueueUnmapMemObject';
Function clEnqueueMigrateMemObjects ( command_queue : cl_command_queue ;
  num_mem_objects : cl_uint ;
  Var mem_objects : cl_mem ;
  flags : cl_mem_migration_flags ;
  num_events_in_wait_list : cl_uint ;
  Var event_wait_list : cl_event ;
  Var event : cl_event ) : cl_int;
external name 'clEnqueueMigrateMemObjects';
Function clEnqueueNDRangeKernel ( command_queue : cl_command_queue ;
  kernel : cl_kernel ;
  work_dim  :   cl_uint ;
    global_work_offset  :   pointer ;
  Var global_work_size  :   size_t ;
  Var local_work_size  :   size_t ;
  num_events_in_wait_list  :   cl_uint ;
    event_wait_list  :   pointer ;
   var event :cl_event )  :   cl_int
;
external name 'clEnqueueNDRangeKernel';
Function clEnqueueNativeKernel( command_queue : cl_command_queue ;
 user_func :Procedure(vp:pointer);
Var args : pointer ;
 cb_args : size_t ;
 num_mem_objects : cl_uint ;
Var mem_list : cl_mem ;
Var args_mem_loc : ^ pointer ;
 num_events_in_wait_list : cl_uint ;
Var event_wait_list : cl_event ;
Var event : cl_event ) : cl_int;
 external name 'clEnqueueNativeKernel';
Function clEnqueueMarkerWithWaitList ( command_queue : cl_command_queue ;
  num_events_in_wait_list : cl_uint ;
  Var event_wait_list : cl_event ;
  Var event : cl_event ) : cl_int;
external name 'clEnqueueMarkerWithWaitList';
Function clEnqueueBarrierWithWaitList ( command_queue : cl_command_queue ;
  num_events_in_wait_list : cl_uint ;
  Var event_wait_list : cl_event ;
  Var event : cl_event ) : cl_int;
external name 'clEnqueueBarrierWithWaitList';
Function clEnqueueSVMFree( command_queue : cl_command_queue ;
 num_svm_pointers : cl_uint ;
 svm_pointers:pointer ;
 pfn_free_func : Procedure( queue  :  cl_command_queue
 ;
 num_svm_pointers  :  cl_uint ;
 svm_pointers :pointer;
 user_data : pointer );
user_data : pointer ;
num_events_in_wait_list : cl_uint ;
Var event_wait_list : cl_event ;
Var event : cl_event ) : cl_int;
 external name 'clEnqueueSVMFree';
Function clEnqueueSVMMemcpy ( command_queue : cl_command_queue ;
 blocking_copy : cl_bool ;
 Var dst_ptr  :  pointer ;
 Var src_ptr : pointer ;
 size : size_t ;
 num_events_in_wait_list  :  cl_uint ;
 Var event_wait_list : cl_event ;
 Var event : cl_event ) : cl_int;
external name 'clEnqueueSVMMemcpy';
Function clEnqueueSVMMemFill( command_queue : cl_command_queue ;
 Var svm_ptr : pointer ;
 Var pattern : pointer ;
 pattern_size : size_t ;
 size : size_t ;
 num_events_in_wait_list : cl_uint ;
 Var event_wait_list : cl_event ;
 Var event  :  cl_event ) : cl_int;
external name 'clEnqueueSVMMemFill';
Function clEnqueueSVMMap ( command_queue : cl_command_queue ;
 blocking_map  :  cl_bool ;
 flags : cl_map_flags ;
 Var svm_ptr : pointer ;
 size : size_t ;
 num_events_in_wait_list : cl_uint ;
 Var event_wait_list : cl_event ;
 Var event : cl_event
) : cl_int;
external name 'clEnqueueSVMMap';
Function clEnqueueSVMUnmap ( command_queue : cl_command_queue ;
 Var svm_ptr : pointer ;
 num_events_in_wait_list  :  cl_uint ;
 Var event_wait_list : cl_event ;
 Var event : cl_event ) : cl_int;
external name 'clEnqueueSVMUnmap' ;
Function clEnqueueSVMMigrateMem( command_queue : cl_command_queue ;
 num_svm_pointers : cl_uint ;
 Var  svm_pointers : ^ pointer ;
 Var sizes
 : size_t ;
 flags  :  cl_mem_migration_flags ;
 num_events_in_wait_list : cl_uint ;
 Var event_wait_list : cl_event ;
 Var  event : cl_event ) : cl_int;
external name 'clEnqueueSVMUnmap';
Implementation
Begin
End.
