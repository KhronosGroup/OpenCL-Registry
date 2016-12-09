#!gmake

# This Makefile is used to transform OpenCL reference pages in DocBook XML format to HTML web pages.
# Directory structure:
#
#    man/      -- contains .xml input files
#    man/xhtml -- contains Makefile, CSS, build tools, and .html output files

# XSLT processor - other possibilities like Saxon exist
XSLT	= xsltproc --nonet

SED	= sed
MV	= mv

# Location of locally customized stylesheet, which imports
# the Docbook modular stylesheets, and specifically the
# stylesheet to convert Docbook+MathML => XHTML+MathML
DB2XHTML = opencl-man.xsl

# Additional global dependencies that should cause a re-build of all pages:
ADDTL_DEPS = copyright.inc.xsl styles-css.xsl pageNumberLookup.rb

# Filter program to fix up links to specification page numbers:
PAGENUM_FIXUP = ./pageNumberLookup.rb

.SUFFIXES: .gl .xml .html .xhtml .ck.xhtml .tex .pdf .3G .tar .tar.gz
#.PHONY: man html 

HTMLFILES = \
	abstractDataTypes.html \
	abs.html \
	accessQualifiers.html \
	acos.html \
	add_sat.html \
	any.html \
	as_typen.html \
	asin.html \
	asyncCopyFunctions.html \
	async_work_group_copy.html \
	async_work_group_strided_copy.html \
	atan.html \
	atomic_add.html \
	atomic_and.html \
	atomic_cmpxchg.html \
	atomic_dec.html \
	atomic_inc.html \
	atomic_max.html \
	atomic_min.html \
	atomic_or.html \
	atomic_sub.html \
	atomic_xchg.html \
	atomic_xor.html \
	atomicFunctions.html \
	attribute.html \
	attributes-blocksAndControlFlow.html \
	attributes-types.html \
	attributes-variables.html \
	barrier.html \
	bitselect.html \
	cbrt.html \
	ceil.html \
	clamp.html \
	classDiagram.html \
	clBuildProgram.html \
	clCreateBuffer.html \
	clCreateCommandQueue.html \
	clCreateContext.html \
	clCreateContextFromType.html \
	clCreateEventFromGLsyncKHR.html \
	clCreateFromD3D10Texture2DKHR.html \
	clCreateFromD3D10Texture3DKHR.html \
	clCreateFromD3D10BufferKHR.html \
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
	clCreateSubBuffer.html \
	clCreateUserEvent.html \
	clEnqueueAcquireD3D10ObjectsKHR.html \
	clEnqueueAcquireGLObjects.html \
	clEnqueueBarrier.html \
	clEnqueueCopyBuffer.html \
	clEnqueueCopyBufferRect.html \
	clEnqueueCopyImage.html \
	clEnqueueCopyBufferToImage.html \
	clEnqueueCopyImageToBuffer.html \
	clEnqueueMapBuffer.html \
	clEnqueueMapImage.html \
	clEnqueueMarker.html \
	clEnqueueNDRangeKernel.html \
	clEnqueueNativeKernel.html \
	clEnqueueReadBuffer.html \
	clEnqueueReadBufferRect.html \
	clEnqueueReadImage.html \
	clEnqueueReleaseD3D10ObjectsKHR.html \
	clEnqueueWriteBuffer.html \
	clEnqueueWriteBufferRect.html \
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
	clGetDeviceIDsFromD3D10KHR.html \
	clGetDeviceInfo.html \
	clGetEventInfo.html \
	clGetEventProfilingInfo.html \
	clGetExtensionFunctionAddress.html \
	clGetGLContextInfoKHR.html \
	clGetGLObjectInfo.html \
	clGetGLTextureInfo.html \
	clGetImageInfo.html \
	clGetKernelInfo.html \
	clGetKernelWorkGroupInfo.html \
	clGetMemObjectInfo.html \
	clGetPlatformIDs.html \
	clGetPlatformInfo.html \
	clGetProgramBuildInfo.html \
	clGetProgramInfo.html \
	clGetSamplerInfo.html \
	clGetSupportedImageFormats.html \
	cl_image_format.html \
	cl_khr_3d_image_writes.html \
	cl_khr_d3d10_sharing.html \
	cl_khr_fp16.html \
	cl_khr_fp64.html \
	cl_khr_int64_base_atomics.html \
	cl_khr_int64_extended_atomics.html \
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
	clSetEventCallback.html \
	clSetMemObjectDestructorCallback.html \
	clSetKernelArg.html \
	clSetUserEventStatus.html \
	clUnloadCompiler.html \
	clWaitForEvents.html \
	clz.html \
	commonFunctions.html \
	commonMin.html \
	commonMax.html \
	constant.html \
	convert_T.html \
	copysign.html \
	cos.html \
	cross.html \
	d3d10_sharing.html \
	dataTypes.html \
	degrees.html \
	distance.html \
	divide.html \
	dot.html \
	enums.html \
	erf.html \
	exp.html \
	explicitMemoryFenceFunctions.html \
	EXTENSION.html \
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
	get_global_offset.html \
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
	gl_event.html \
	gl_sharing.html \
	global.html \
	hadd.html \
	hypot.html \
	ilogb.html \
	imageFunctions.html \
	integerClamp.html \
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
	mag.html \
	mathConstants.html \
	mathFunctions.html \
	mem_fence.html \
	miscVectorFunctions.html \
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
	qualifiers.html \
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
	shuffle.html \
	sign.html \
	signbit.html \
	sin.html \
	smoothstep.html \
	sqrt.html \
	step.html \
	sub_sat.html \
	supportedImageFormats.html \
	tan.html \
	tgamma.html \
	trunc.html \
	upsample.html \
	vec_step.html \
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

%.html: ../%.xml $(DB2XHTML) $(ADDTL_DEPS)
	$(XSLT) --xinclude -o $@.tmp1 $(DB2XHTML) $<
	$(SED) 's/<?xml-stylesheet/<!-- saved from url=(0013)about:internet -->\n<?xml-stylesheet/g' $@.tmp1 | \
	$(SED) 's#http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd#xhtml1-transitional.dtd#g' > $@.tmp2
	$(PAGENUM_FIXUP) $@.tmp2 > $@.tmp3
	$(MV) $@.tmp3 $@
	$(RM) $@.tmp[123]

default: $(HTMLFILES)

clean:
	$(RM) $(HTMLFILES)

clobber:
	$(RM) $(HTMLFILES)

# The following XML include files dependencies can be generated with:
#    cd ../man
#    grep '!ENTITY' *.xml | sed -e 's/:.*SYSTEM "/: ..\//' -e 's/">//' -e 's/\.xml:/.html:/'

abs.html: ../integerFunctionsInc.xml
acos.html: ../mathFunctionsInc.xml
add_sat.html: ../integerFunctionsInc.xml
any.html: ../relationalFunctionsInc1.xml
any.html: ../relationalFunctionsIGEN.xml
asin.html: ../mathFunctionsInc.xml
atan.html: ../mathFunctionsInc.xml
bitselect.html: ../relationalFunctionsInc1.xml
bitselect.html: ../relationalFunctionsGEN.xml
cbrt.html: ../mathFunctionsInc.xml
ceil.html: ../mathFunctionsInc.xml
clamp.html: ../commonFunctionsInc.xml
clz.html: ../integerFunctionsInc.xml
commonFunctions.html: ../commonFunctionsInc.xml
commonMax.html: ../commonFunctionsInc.xml
commonMin.html: ../commonFunctionsInc.xml
copysign.html: ../mathFunctionsInc.xml
cos.html: ../mathFunctionsInc.xml
cross.html: ../geometricFunctionsInc.xml
degrees.html: ../commonFunctionsInc.xml
distance.html: ../geometricFunctionsInc.xml
dot.html: ../geometricFunctionsInc.xml
erf.html: ../mathFunctionsInc.xml
exp.html: ../mathFunctionsInc.xml
fabs.html: ../mathFunctionsInc.xml
fast_distance.html: ../geometricFunctionsInc.xml
fast_length.html: ../geometricFunctionsInc.xml
fast_normalize.html: ../geometricFunctionsInc.xml
fdim.html: ../mathFunctionsInc.xml
floor.html: ../mathFunctionsInc.xml
fma.html: ../mathFunctionsInc.xml
fmax.html: ../mathFunctionsInc.xml
fmin.html: ../mathFunctionsInc.xml
fmod.html: ../mathFunctionsInc.xml
fract.html: ../mathFunctionsInc.xml
frexp.html: ../mathFunctionsInc.xml
geometricFunctions.html: ../geometricFunctionsInc.xml
hadd.html: ../integerFunctionsInc.xml
hypot.html: ../mathFunctionsInc.xml
ilogb.html: ../mathFunctionsInc.xml
imageFunctions.html: ../imageFunctionsInc.xml
integerClamp.html: ../integerFunctionsInc.xml
integerFunctions.html: ../integerFunctionsInc.xml
integerMax.html: ../integerFunctionsInc.xml
isequal.html: ../relationalFunctionsInc1.xml
isequal.html: ../relationalFunctionsInc2.xml
isequal.html: ../relationalFunctionsInc3.xml
isfinite.html: ../relationalFunctionsInc1.xml
isfinite.html: ../relationalFunctionsInc2.xml
isgreaterequal.html: ../relationalFunctionsInc1.xml
isgreaterequal.html: ../relationalFunctionsInc2.xml
isgreaterequal.html: ../relationalFunctionsInc3.xml
isgreater.html: ../relationalFunctionsInc1.xml
isgreater.html: ../relationalFunctionsInc2.xml
isgreater.html: ../relationalFunctionsInc3.xml
isinf.html: ../relationalFunctionsInc1.xml
isinf.html: ../relationalFunctionsInc2.xml
islessequal.html: ../relationalFunctionsInc1.xml
islessequal.html: ../relationalFunctionsInc2.xml
islessequal.html: ../relationalFunctionsInc3.xml
islessgreater.html: ../relationalFunctionsInc1.xml
islessgreater.html: ../relationalFunctionsInc2.xml
islessgreater.html: ../relationalFunctionsInc3.xml
isless.html: ../relationalFunctionsInc1.xml
isless.html: ../relationalFunctionsInc2.xml
isless.html: ../relationalFunctionsInc3.xml
isnan.html: ../relationalFunctionsInc1.xml
isnan.html: ../relationalFunctionsInc2.xml
isnormal.html: ../relationalFunctionsInc1.xml
isnormal.html: ../relationalFunctionsInc2.xml
isnotequal.html: ../relationalFunctionsInc1.xml
isnotequal.html: ../relationalFunctionsInc2.xml
isnotequal.html: ../relationalFunctionsInc3.xml
isordered.html: ../relationalFunctionsInc1.xml
isordered.html: ../relationalFunctionsInc2.xml
isunordered.html: ../relationalFunctionsInc1.xml
isunordered.html: ../relationalFunctionsInc2.xml
length.html: ../geometricFunctionsInc.xml
lgamma.html: ../mathFunctionsInc.xml
log.html: ../mathFunctionsInc.xml
mad_hi.html: ../integerFunctionsInc.xml
mad_sat.html: ../integerFunctionsInc.xml
mad.html: ../mathFunctionsInc.xml
mag.html: ../mathFunctionsInc.xml
mix.html: ../commonFunctionsInc.xml
modf.html: ../mathFunctionsInc.xml
mul_hi.html: ../integerFunctionsInc.xml
nan.html: ../mathFunctionsInc.xml
nextafter.html: ../mathFunctionsInc.xml
normalize.html: ../geometricFunctionsInc.xml
pow.html: ../mathFunctionsInc.xml
radians.html: ../commonFunctionsInc.xml
read_imagef2d.html: ../imageFunctionsInc.xml
read_imagef3d.html: ../imageFunctionsInc.xml
read_imageh2d.html: ../imageFunctionsInc.xml
read_imageh3d.html: ../imageFunctionsInc.xml
read_imagei2d.html: ../imageFunctionsInc.xml
read_imagei3d.html: ../imageFunctionsInc.xml
relationalFunctions.html: ../relationalFunctionsInc1.xml
remainder.html: ../mathFunctionsInc.xml
remquo.html: ../mathFunctionsInc.xml
rint.html: ../mathFunctionsInc.xml
rootn.html: ../mathFunctionsInc.xml
rotate.html: ../integerFunctionsInc.xml
round.html: ../mathFunctionsInc.xml
select.html: ../relationalFunctionsInc1.xml
select.html: ../relationalFunctionsGEN.xml
select.html: ../relationalFunctionsIGEN.xml
select.html: ../relationalFunctionsUGEN.xml
signbit.html: ../relationalFunctionsInc1.xml
signbit.html: ../relationalFunctionsInc2.xml
sign.html: ../commonFunctionsInc.xml
sin.html: ../mathFunctionsInc.xml
smoothstep.html: ../commonFunctionsInc.xml
sqrt.html: ../mathFunctionsInc.xml
step.html: ../commonFunctionsInc.xml
sub_sat.html: ../integerFunctionsInc.xml
tan.html: ../mathFunctionsInc.xml
tgamma.html: ../mathFunctionsInc.xml
trunc.html: ../mathFunctionsInc.xml
upsample.html: ../integerFunctionsInc.xml
vectorDataLoadandStoreFunctions.html: ../vectorFunctionsInc.xml
vloada_halfn.html: ../vectorFunctionsInc.xml
vload_halfn.html: ../vectorFunctionsInc.xml
vload_half.html: ../vectorFunctionsInc.xml
vloadn.html: ../vectorFunctionsInc.xml
vloadn.html: ../vectorHalfFunctionsInc.xml
vloadn.html: ../vectorDoubleFunctionsInc.xml
vstorea_halfn.html: ../vectorFunctionsInc.xml
vstorea_halfn.html: ../vectorDoubleFunctionsInc.xml
vstore_halfn.html: ../vectorFunctionsInc.xml
vstore_halfn.html: ../vectorDoubleFunctionsInc.xml
vstore_half.html: ../vectorFunctionsInc.xml
vstore_half.html: ../vectorDoubleFunctionsInc.xml
vstoren.html: ../vectorFunctionsInc.xml
vstoren.html: ../vectorHalfFunctionsInc.xml
vstoren.html: ../vectorDoubleFunctionsInc.xml
write_imageh2d.html: ../imageFunctionsInc.xml
write_imageh3d.html: ../imageFunctionsInc.xml
write_image.html: ../imageFunctionsInc.xml

