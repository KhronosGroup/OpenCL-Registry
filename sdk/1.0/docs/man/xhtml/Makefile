#!gmake

# This Makefile is used to transform OpenCL reference pages in DocBook XML format to HTML web pages.

# XSLT processor - other possibilities like Saxon exist
XSLT	= xsltproc --nonet

SED	= sed
MV	= mv

# Location of locally customized stylesheet, which imports
# the Docbook modular stylesheets, and specifically the
# stylesheet to convert Docbook+MathML => XHTML+MathML
DB2XHTML = opencl-man.xsl

# Additional dependencies that should cause a re-build of all pages:
ADDTL_DEPS = copyright.inc.xsl styles-css.xsl pageNumberLookup.rb

# Filter program to fix up links to specification page numbers:
PAGENUM_FIXUP = ./pageNumberLookup.rb

.SUFFIXES: .gl .xml .html .xhtml .ck.xhtml .tex .pdf .3G .tar .tar.gz
#.PHONY: man html 

%.html: ../%.xml $(DB2XHTML) $(ADDTL_DEPS)
	$(XSLT) --xinclude -o $@.tmp1 $(DB2XHTML) $<
	$(SED) 's/<?xml-stylesheet/<!-- saved from url=(0013)about:internet -->\n<?xml-stylesheet/g' $@.tmp1 | \
	$(SED) 's#http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd#xhtml1-transitional.dtd#g' > $@.tmp2
	$(PAGENUM_FIXUP) $@.tmp2 > $@.tmp3
	$(MV) $@.tmp3 $@
	$(RM) $@.tmp[123]


# man pages
HTMLFILES = \
	EXTENSION.html \
	SELECT_ROUNDING_MODE.html \
	abstractDataTypes.html \
	abs.html \
	acos.html \
	add_sat.html \
	any.html \
	as_typen.html \
	asin.html \
	asyncCopyFunctions.html \
	async_work_group_copy.html \
	atan.html \
	atomicFunctions.html \
	attribute.html \
	attributes-blocksAndControlFlow.html \
	attributes-types.html \
	attributes-variables.html \
	barrier.html \
	bitselect.html \
	cbrt.html \
	ceil.html \
	clBuildProgram.html \
	clCreateBuffer.html \
	clCreateCommandQueue.html \
	clCreateContext.html \
	clCreateContextFromType.html \
	clCreateFromGLBuffer.html \
	clCreateFromGLRenderbuffer.html \
	clCreateFromGLTexture2D.html \
	clCreateFromGLTexture3D.html \
	clCreateImage2D.html \
	clCreateImage3D.html \
	clCreateKernel.html \
	clCreateKernelsInProgram.html \
	clCreateProgramWithBinary.html \
	clCreateProgramWithSource.html \
	clCreateSampler.html \
	clEnqueueAcquireGLObjects.html \
	clEnqueueBarrier.html \
	clEnqueueCopyBuffer.html \
	clEnqueueCopyImage.html \
	clEnqueueCopyBufferToImage.html \
	clEnqueueCopyImageToBuffer.html \
	clEnqueueMapBuffer.html \
	clEnqueueMapImage.html \
	clEnqueueMarker.html \
	clEnqueueNDRangeKernel.html \
	clEnqueueNativeKernel.html \
	clEnqueueReadBuffer.html \
	clEnqueueReadImage.html \
	clEnqueueWriteBuffer.html \
	clEnqueueWriteImage.html \
	clEnqueueReleaseGLObjects.html \
	clEnqueueTask.html \
	clEnqueueUnmapMemObject.html \
	clEnqueueWaitForEvents.html \
	clFinish.html \
	clFlush.html \
	clGetCommandQueueInfo.html \
	clGetContextInfo.html \
	clGetDeviceIDs.html \
	clGetDeviceInfo.html \
	clGetEventInfo.html \
	clGetExtensionFunctionAddress.html \
	clGetImageInfo.html \
	clGetKernelInfo.html \
	clGetKernelWorkGroupInfo.html \
	clGetMemObjectInfo.html \
	clGetPlatformIDs.html \
	clGetPlatformInfo.html \
	clGetProgramBuildInfo.html \
	clGetProgramInfo.html \
	clGetEventProfilingInfo.html \
	clGetSamplerInfo.html \
	clGetSupportedImageFormats.html \
	clGetGLObjectInfo.html \
	clGetGLTextureInfo.html \
	clReleaseCommandQueue.html \
	clReleaseContext.html \
	clReleaseEvent.html \
	clReleaseKernel.html \
	clReleaseMemObject.html \
	clReleaseProgram.html \
	clReleaseSampler.html \
	clRetainCommandQueue.html \
	clRetainContext.html \
	clRetainEvent.html \
	clRetainKernel.html \
	clRetainMemObject.html \
	clRetainProgram.html \
	clRetainSampler.html \
	clSetCommandQueueProperty.html \
	clSetKernelArg.html \
	clUnloadCompiler.html \
	clWaitForEvents.html \
	cl_image_format.html \
	cl_khr_3d_image_writes.html \
	cl_khr_byte_addressable_store.html \
	cl_khr_fp16.html \
	cl_khr_fp64.html \
	cl_khr_global_int32_base_atomics.html \
	cl_khr_global_int32_extended_atomics.html \
	cl_khr_int64_base_atomics.html \
	cl_khr_int64_extended_atomics.html \
	cl_khr_local_int32_base_atomics.html \
	cl_khr_local_int32_extended_atomics.html \
	cl_khr_select_fprounding_mode.html \
	clamp.html \
	clz.html \
	commonFunctions.html \
	commonMin.html \
	commonMax.html \
	constant.html \
	convert_T.html \
	copysign.html \
	cos.html \
	cross.html \
	degrees.html \
	distance.html \
	divide.html \
	dot.html \
	enums.html \
	erf.html \
	errors.html \
	exp.html \
	explicitMemoryFenceFunctions.html \
	fabs.html \
	fast_distance.html \
	fast_length.html \
	fast_normalize.html \
	fdim.html \
	floor.html \
	fma.html \
	fmax.html \
	fmin.html \
	fmod.html \
	FP_CONTRACT.html \
	fract.html \
	frexp.html \
	functionQualifiers.html \
	geometricFunctions.html \
	get_global_id.html \
	get_global_size.html \
	get_group_id.html \
	get_image_channel_data_type.html \
	get_image_channel_order.html \
	get_image_depth.html \
	get_image_dim.html \
	get_image_height.html \
	get_image_width.html \
	get_local_id.html \
	get_local_size.html \
	get_num_groups.html \
	get_work_dim.html \
	gl_sharing.html \
	global.html \
	hadd.html \
	hypot.html \
	ilogb.html \
	imageAccessQualifiers.html \
	imageFunctions.html \
	integerFunctions.html \
	integerMax.html \
	isequal.html \
	isfinite.html \
	isgreater.html \
	isgreaterequal.html \
	isinf.html \
	isless.html \
	islessequal.html \
	islessgreater.html \
	isnan.html \
	isnormal.html \
	isnotequal.html \
	isordered.html \
	isunordered.html \
	ldexp.html \
	length.html \
	lgamma.html \
	local.html \
	log.html \
	macroLimits.html \
	mad.html \
	mad24.html \
	mad_hi.html \
	mad_sat.html \
	mathConstants.html \
	mathFunctions.html \
	mem_fence.html \
	mix.html \
	modf.html \
	mul24.html \
	mul_hi.html \
	nan.html \
	nextafter.html \
	normalize.html \
	operators.html \
	otherDataTypes.html \
	prefetch.html \
	preprocessorDirectives.html \
	private.html \
	pow.html \
	radians.html \
	recip.html \
	relationalFunctions.html \
	read_imagef3d.html \
	read_imagef2d.html \
	read_imagei2d.html \
	read_imagei3d.html \
	read_imageh2d.html \
	read_imageh3d.html \
	read_mem_fence.html \
	remainder.html \
	remquo.html \
	reservedDataTypes.html \
	restrictions.html \
	rint.html \
	rootn.html \
	rotate.html \
	round.html \
	sampler_t.html \
	scalarDataTypes.html \
	select.html \
	sign.html \
	signbit.html \
	sin.html \
	smoothstep.html \
	sqrt.html \
	step.html \
	sub_sat.html \
	tan.html \
	tgamma.html \
	trunc.html \
	upsample.html \
	vectorDataLoadandStoreFunctions.html \
	vectorDataTypes.html \
	vloadn.html \
	vload_half.html \
	vload_halfn.html \
	vloada_halfn.html \
	vstoren.html \
	vstore_half.html \
	vstore_halfn.html \
	vstorea_halfn.html \
	wait_group_events.html \
	workItemFunctions.html \
	write_image.html \
	write_imageh2d.html \
	write_imageh3d.html \
	write_mem_fence.html


default: $(HTMLFILES)

clean:
	$(RM) $(HTMLFILES)

clobber:
	$(RM) $(HTMLFILES)

