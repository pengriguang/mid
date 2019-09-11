/**
 * <interfacename>system_lib</interfacename>
 * <description></description>
 *
 * <copyright></copyright>
 */

SET_INTERFACE_NAME(`system_lib')

/** EXTERN LIB SECTION BEGIN **/
/*  Comments are ignored for m4 compiler so restructured text can be used. changecom(`/*', `*/') */

#ifdef __cplusplus
extern "C" {
#endif

/**
 * <description>do_system</description>
 */
typedef struct tagdo_system_struct
{
	RTS_IEC_STRING cmd[256];			/* VAR_INPUT */	
	RTS_IEC_INT do_system;				/* VAR_OUTPUT */	
} do_system_struct;

DEF_API(`void',`CDECL',`do_system',`(do_system_struct *p)',1,0x4921B65F,0x03050A28)

#ifdef __cplusplus
}
#endif

/** EXTERN LIB SECTION END **/

