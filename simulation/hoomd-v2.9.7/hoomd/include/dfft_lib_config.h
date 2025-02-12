#ifndef __DFFT_LIB_CONFIG_H__
#define __DFFT_LIB_CONFIG_H__

/* some numeric mappings for FFT libraries */
#define LOCAL_LIB_BARE 1
#define LOCAL_LIB_MKL 2
#define LOCAL_LIB_ACML 3

// global settings
#define LOCAL_FFT_LIB LOCAL_LIB_BARE
#define ENABLE_HOST
//#define ENABLE_CUDA
/* #undef ENABLE_MPI_CUDA */

#endif
