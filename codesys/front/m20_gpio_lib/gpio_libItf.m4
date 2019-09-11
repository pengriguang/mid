/**
 * <interfacename>gpio_lib</interfacename>
 * <description></description>
 *
 * <copyright></copyright>
 */

SET_INTERFACE_NAME(`gpio_lib')

/** EXTERN LIB SECTION BEGIN **/
/*  Comments are ignored for m4 compiler so restructured text can be used. changecom(`/*', `*/') */

#ifdef __cplusplus
extern "C" {
#endif

/**
 * <description>set_gpio_value</description>
 */
typedef struct tagset_gpio_value_struct
{
	RTS_IEC_INT num;					/* VAR_INPUT */	
	RTS_IEC_INT value;					/* VAR_INPUT */	
	RTS_IEC_INT set_gpio_value;			/* VAR_OUTPUT */	
} set_gpio_value_struct;

DEF_API(`void',`CDECL',`set_gpio_value',`(set_gpio_value_struct *p)',1,0x97C12E90,0x03050A28)

#ifdef __cplusplus
}
#endif

/** EXTERN LIB SECTION END **/

