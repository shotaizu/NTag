��
��
B
AssignVariableOp
resource
value"dtype"
dtypetype�
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Const
output"dtype"
valuetensor"
dtypetype
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(�

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetype�
E
Relu
features"T
activations"T"
Ttype:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
?
Select
	condition

t"T
e"T
output"T"	
Ttype
H
ShardedFilename
basename	
shard

num_shards
filename
0
Sigmoid
x"T
y"T"
Ttype:

2
�
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring �
@
StaticRegexFullMatch	
input

output
"
patternstring
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
�
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 �"serve*2.6.22v2.6.1-9-gc2363d6d0258��

y
hidden1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�*
shared_namehidden1/kernel
r
"hidden1/kernel/Read/ReadVariableOpReadVariableOphidden1/kernel*
_output_shapes
:	�*
dtype0
q
hidden1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:�*
shared_namehidden1/bias
j
 hidden1/bias/Read/ReadVariableOpReadVariableOphidden1/bias*
_output_shapes	
:�*
dtype0
z
hidden2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
��*
shared_namehidden2/kernel
s
"hidden2/kernel/Read/ReadVariableOpReadVariableOphidden2/kernel* 
_output_shapes
:
��*
dtype0
q
hidden2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:�*
shared_namehidden2/bias
j
 hidden2/bias/Read/ReadVariableOpReadVariableOphidden2/bias*
_output_shapes	
:�*
dtype0
z
hidden3/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
��*
shared_namehidden3/kernel
s
"hidden3/kernel/Read/ReadVariableOpReadVariableOphidden3/kernel* 
_output_shapes
:
��*
dtype0
q
hidden3/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:�*
shared_namehidden3/bias
j
 hidden3/bias/Read/ReadVariableOpReadVariableOphidden3/bias*
_output_shapes	
:�*
dtype0
w
output/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�*
shared_nameoutput/kernel
p
!output/kernel/Read/ReadVariableOpReadVariableOpoutput/kernel*
_output_shapes
:	�*
dtype0
n
output/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_nameoutput/bias
g
output/bias/Read/ReadVariableOpReadVariableOpoutput/bias*
_output_shapes
:*
dtype0
f
	Adam/iterVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_name	Adam/iter
_
Adam/iter/Read/ReadVariableOpReadVariableOp	Adam/iter*
_output_shapes
: *
dtype0	
j
Adam/beta_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_1
c
Adam/beta_1/Read/ReadVariableOpReadVariableOpAdam/beta_1*
_output_shapes
: *
dtype0
j
Adam/beta_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_2
c
Adam/beta_2/Read/ReadVariableOpReadVariableOpAdam/beta_2*
_output_shapes
: *
dtype0
h

Adam/decayVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name
Adam/decay
a
Adam/decay/Read/ReadVariableOpReadVariableOp
Adam/decay*
_output_shapes
: *
dtype0
x
Adam/learning_rateVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_nameAdam/learning_rate
q
&Adam/learning_rate/Read/ReadVariableOpReadVariableOpAdam/learning_rate*
_output_shapes
: *
dtype0
^
totalVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nametotal
W
total/Read/ReadVariableOpReadVariableOptotal*
_output_shapes
: *
dtype0
^
countVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namecount
W
count/Read/ReadVariableOpReadVariableOpcount*
_output_shapes
: *
dtype0
u
true_positivesVarHandleOp*
_output_shapes
: *
dtype0*
shape:�*
shared_nametrue_positives
n
"true_positives/Read/ReadVariableOpReadVariableOptrue_positives*
_output_shapes	
:�*
dtype0
u
true_negativesVarHandleOp*
_output_shapes
: *
dtype0*
shape:�*
shared_nametrue_negatives
n
"true_negatives/Read/ReadVariableOpReadVariableOptrue_negatives*
_output_shapes	
:�*
dtype0
w
false_positivesVarHandleOp*
_output_shapes
: *
dtype0*
shape:�* 
shared_namefalse_positives
p
#false_positives/Read/ReadVariableOpReadVariableOpfalse_positives*
_output_shapes	
:�*
dtype0
w
false_negativesVarHandleOp*
_output_shapes
: *
dtype0*
shape:�* 
shared_namefalse_negatives
p
#false_negatives/Read/ReadVariableOpReadVariableOpfalse_negatives*
_output_shapes	
:�*
dtype0
x
true_positives_1VarHandleOp*
_output_shapes
: *
dtype0*
shape:*!
shared_nametrue_positives_1
q
$true_positives_1/Read/ReadVariableOpReadVariableOptrue_positives_1*
_output_shapes
:*
dtype0
z
false_negatives_1VarHandleOp*
_output_shapes
: *
dtype0*
shape:*"
shared_namefalse_negatives_1
s
%false_negatives_1/Read/ReadVariableOpReadVariableOpfalse_negatives_1*
_output_shapes
:*
dtype0
x
true_positives_2VarHandleOp*
_output_shapes
: *
dtype0*
shape:*!
shared_nametrue_positives_2
q
$true_positives_2/Read/ReadVariableOpReadVariableOptrue_positives_2*
_output_shapes
:*
dtype0
z
false_positives_1VarHandleOp*
_output_shapes
: *
dtype0*
shape:*"
shared_namefalse_positives_1
s
%false_positives_1/Read/ReadVariableOpReadVariableOpfalse_positives_1*
_output_shapes
:*
dtype0
y
true_positives_3VarHandleOp*
_output_shapes
: *
dtype0*
shape:�*!
shared_nametrue_positives_3
r
$true_positives_3/Read/ReadVariableOpReadVariableOptrue_positives_3*
_output_shapes	
:�*
dtype0
y
true_negatives_1VarHandleOp*
_output_shapes
: *
dtype0*
shape:�*!
shared_nametrue_negatives_1
r
$true_negatives_1/Read/ReadVariableOpReadVariableOptrue_negatives_1*
_output_shapes	
:�*
dtype0
{
false_positives_2VarHandleOp*
_output_shapes
: *
dtype0*
shape:�*"
shared_namefalse_positives_2
t
%false_positives_2/Read/ReadVariableOpReadVariableOpfalse_positives_2*
_output_shapes	
:�*
dtype0
{
false_negatives_2VarHandleOp*
_output_shapes
: *
dtype0*
shape:�*"
shared_namefalse_negatives_2
t
%false_negatives_2/Read/ReadVariableOpReadVariableOpfalse_negatives_2*
_output_shapes	
:�*
dtype0
�
Adam/hidden1/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�*&
shared_nameAdam/hidden1/kernel/m
�
)Adam/hidden1/kernel/m/Read/ReadVariableOpReadVariableOpAdam/hidden1/kernel/m*
_output_shapes
:	�*
dtype0

Adam/hidden1/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:�*$
shared_nameAdam/hidden1/bias/m
x
'Adam/hidden1/bias/m/Read/ReadVariableOpReadVariableOpAdam/hidden1/bias/m*
_output_shapes	
:�*
dtype0
�
Adam/hidden2/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:
��*&
shared_nameAdam/hidden2/kernel/m
�
)Adam/hidden2/kernel/m/Read/ReadVariableOpReadVariableOpAdam/hidden2/kernel/m* 
_output_shapes
:
��*
dtype0

Adam/hidden2/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:�*$
shared_nameAdam/hidden2/bias/m
x
'Adam/hidden2/bias/m/Read/ReadVariableOpReadVariableOpAdam/hidden2/bias/m*
_output_shapes	
:�*
dtype0
�
Adam/hidden3/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:
��*&
shared_nameAdam/hidden3/kernel/m
�
)Adam/hidden3/kernel/m/Read/ReadVariableOpReadVariableOpAdam/hidden3/kernel/m* 
_output_shapes
:
��*
dtype0

Adam/hidden3/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:�*$
shared_nameAdam/hidden3/bias/m
x
'Adam/hidden3/bias/m/Read/ReadVariableOpReadVariableOpAdam/hidden3/bias/m*
_output_shapes	
:�*
dtype0
�
Adam/output/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�*%
shared_nameAdam/output/kernel/m
~
(Adam/output/kernel/m/Read/ReadVariableOpReadVariableOpAdam/output/kernel/m*
_output_shapes
:	�*
dtype0
|
Adam/output/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*#
shared_nameAdam/output/bias/m
u
&Adam/output/bias/m/Read/ReadVariableOpReadVariableOpAdam/output/bias/m*
_output_shapes
:*
dtype0
�
Adam/hidden1/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�*&
shared_nameAdam/hidden1/kernel/v
�
)Adam/hidden1/kernel/v/Read/ReadVariableOpReadVariableOpAdam/hidden1/kernel/v*
_output_shapes
:	�*
dtype0

Adam/hidden1/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:�*$
shared_nameAdam/hidden1/bias/v
x
'Adam/hidden1/bias/v/Read/ReadVariableOpReadVariableOpAdam/hidden1/bias/v*
_output_shapes	
:�*
dtype0
�
Adam/hidden2/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:
��*&
shared_nameAdam/hidden2/kernel/v
�
)Adam/hidden2/kernel/v/Read/ReadVariableOpReadVariableOpAdam/hidden2/kernel/v* 
_output_shapes
:
��*
dtype0

Adam/hidden2/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:�*$
shared_nameAdam/hidden2/bias/v
x
'Adam/hidden2/bias/v/Read/ReadVariableOpReadVariableOpAdam/hidden2/bias/v*
_output_shapes	
:�*
dtype0
�
Adam/hidden3/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:
��*&
shared_nameAdam/hidden3/kernel/v
�
)Adam/hidden3/kernel/v/Read/ReadVariableOpReadVariableOpAdam/hidden3/kernel/v* 
_output_shapes
:
��*
dtype0

Adam/hidden3/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:�*$
shared_nameAdam/hidden3/bias/v
x
'Adam/hidden3/bias/v/Read/ReadVariableOpReadVariableOpAdam/hidden3/bias/v*
_output_shapes	
:�*
dtype0
�
Adam/output/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�*%
shared_nameAdam/output/kernel/v
~
(Adam/output/kernel/v/Read/ReadVariableOpReadVariableOpAdam/output/kernel/v*
_output_shapes
:	�*
dtype0
|
Adam/output/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*#
shared_nameAdam/output/bias/v
u
&Adam/output/bias/v/Read/ReadVariableOpReadVariableOpAdam/output/bias/v*
_output_shapes
:*
dtype0

NoOpNoOp
�@
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*�@
value�@B�@ B�@
�
layer_with_weights-0
layer-0
layer-1
layer_with_weights-1
layer-2
layer-3
layer_with_weights-2
layer-4
layer-5
layer_with_weights-3
layer-6
	optimizer
		variables

regularization_losses
trainable_variables
	keras_api

signatures
h

kernel
bias
trainable_variables
	variables
regularization_losses
	keras_api
R
trainable_variables
	variables
regularization_losses
	keras_api
h

kernel
bias
trainable_variables
	variables
regularization_losses
	keras_api
R
trainable_variables
	variables
 regularization_losses
!	keras_api
h

"kernel
#bias
$trainable_variables
%	variables
&regularization_losses
'	keras_api
R
(trainable_variables
)	variables
*regularization_losses
+	keras_api
h

,kernel
-bias
.trainable_variables
/	variables
0regularization_losses
1	keras_api
�
2iter

3beta_1

4beta_2
	5decay
6learning_ratemm�m�m�"m�#m�,m�-m�v�v�v�v�"v�#v�,v�-v�
8
0
1
2
3
"4
#5
,6
-7
 
8
0
1
2
3
"4
#5
,6
-7
�

7layers
8layer_regularization_losses
9non_trainable_variables
		variables

regularization_losses
trainable_variables
:metrics
;layer_metrics
 
ZX
VARIABLE_VALUEhidden1/kernel6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE
VT
VARIABLE_VALUEhidden1/bias4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUE

0
1

0
1
 
�

<layers
=layer_regularization_losses
trainable_variables
	variables
regularization_losses
>non_trainable_variables
?metrics
@layer_metrics
 
 
 
�

Alayers
Blayer_regularization_losses
trainable_variables
	variables
regularization_losses
Cnon_trainable_variables
Dmetrics
Elayer_metrics
ZX
VARIABLE_VALUEhidden2/kernel6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUE
VT
VARIABLE_VALUEhidden2/bias4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUE

0
1

0
1
 
�

Flayers
Glayer_regularization_losses
trainable_variables
	variables
regularization_losses
Hnon_trainable_variables
Imetrics
Jlayer_metrics
 
 
 
�

Klayers
Llayer_regularization_losses
trainable_variables
	variables
 regularization_losses
Mnon_trainable_variables
Nmetrics
Olayer_metrics
ZX
VARIABLE_VALUEhidden3/kernel6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE
VT
VARIABLE_VALUEhidden3/bias4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUE

"0
#1

"0
#1
 
�

Players
Qlayer_regularization_losses
$trainable_variables
%	variables
&regularization_losses
Rnon_trainable_variables
Smetrics
Tlayer_metrics
 
 
 
�

Ulayers
Vlayer_regularization_losses
(trainable_variables
)	variables
*regularization_losses
Wnon_trainable_variables
Xmetrics
Ylayer_metrics
YW
VARIABLE_VALUEoutput/kernel6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUE
US
VARIABLE_VALUEoutput/bias4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUE

,0
-1

,0
-1
 
�

Zlayers
[layer_regularization_losses
.trainable_variables
/	variables
0regularization_losses
\non_trainable_variables
]metrics
^layer_metrics
HF
VARIABLE_VALUE	Adam/iter)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEAdam/beta_1+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEAdam/beta_2+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUE
JH
VARIABLE_VALUE
Adam/decay*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUE
ZX
VARIABLE_VALUEAdam/learning_rate2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUE
1
0
1
2
3
4
5
6
 
 
#
_0
`1
a2
b3
c4
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
4
	dtotal
	ecount
f	variables
g	keras_api
�
htrue_positives
itrue_negatives
jfalse_positives
kfalse_negatives
l
thresholds
m	variables
n	keras_api
W
o
thresholds
ptrue_positives
qfalse_negatives
r	variables
s	keras_api
W
t
thresholds
utrue_positives
vfalse_positives
w	variables
x	keras_api
p
ytrue_positives
ztrue_negatives
{false_positives
|false_negatives
}	variables
~	keras_api
OM
VARIABLE_VALUEtotal4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE
OM
VARIABLE_VALUEcount4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE

d0
e1

f	variables
a_
VARIABLE_VALUEtrue_positives=keras_api/metrics/1/true_positives/.ATTRIBUTES/VARIABLE_VALUE
a_
VARIABLE_VALUEtrue_negatives=keras_api/metrics/1/true_negatives/.ATTRIBUTES/VARIABLE_VALUE
ca
VARIABLE_VALUEfalse_positives>keras_api/metrics/1/false_positives/.ATTRIBUTES/VARIABLE_VALUE
ca
VARIABLE_VALUEfalse_negatives>keras_api/metrics/1/false_negatives/.ATTRIBUTES/VARIABLE_VALUE
 

h0
i1
j2
k3

m	variables
 
ca
VARIABLE_VALUEtrue_positives_1=keras_api/metrics/2/true_positives/.ATTRIBUTES/VARIABLE_VALUE
ec
VARIABLE_VALUEfalse_negatives_1>keras_api/metrics/2/false_negatives/.ATTRIBUTES/VARIABLE_VALUE

p0
q1

r	variables
 
ca
VARIABLE_VALUEtrue_positives_2=keras_api/metrics/3/true_positives/.ATTRIBUTES/VARIABLE_VALUE
ec
VARIABLE_VALUEfalse_positives_1>keras_api/metrics/3/false_positives/.ATTRIBUTES/VARIABLE_VALUE

u0
v1

w	variables
ca
VARIABLE_VALUEtrue_positives_3=keras_api/metrics/4/true_positives/.ATTRIBUTES/VARIABLE_VALUE
ca
VARIABLE_VALUEtrue_negatives_1=keras_api/metrics/4/true_negatives/.ATTRIBUTES/VARIABLE_VALUE
ec
VARIABLE_VALUEfalse_positives_2>keras_api/metrics/4/false_positives/.ATTRIBUTES/VARIABLE_VALUE
ec
VARIABLE_VALUEfalse_negatives_2>keras_api/metrics/4/false_negatives/.ATTRIBUTES/VARIABLE_VALUE

y0
z1
{2
|3

}	variables
}{
VARIABLE_VALUEAdam/hidden1/kernel/mRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
yw
VARIABLE_VALUEAdam/hidden1/bias/mPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
}{
VARIABLE_VALUEAdam/hidden2/kernel/mRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
yw
VARIABLE_VALUEAdam/hidden2/bias/mPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
}{
VARIABLE_VALUEAdam/hidden3/kernel/mRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
yw
VARIABLE_VALUEAdam/hidden3/bias/mPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUEAdam/output/kernel/mRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
xv
VARIABLE_VALUEAdam/output/bias/mPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
}{
VARIABLE_VALUEAdam/hidden1/kernel/vRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
yw
VARIABLE_VALUEAdam/hidden1/bias/vPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
}{
VARIABLE_VALUEAdam/hidden2/kernel/vRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
yw
VARIABLE_VALUEAdam/hidden2/bias/vPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
}{
VARIABLE_VALUEAdam/hidden3/kernel/vRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
yw
VARIABLE_VALUEAdam/hidden3/bias/vPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUEAdam/output/kernel/vRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
xv
VARIABLE_VALUEAdam/output/bias/vPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
�
serving_default_hidden1_inputPlaceholder*'
_output_shapes
:���������*
dtype0*
shape:���������
�
StatefulPartitionedCallStatefulPartitionedCallserving_default_hidden1_inputhidden1/kernelhidden1/biashidden2/kernelhidden2/biashidden3/kernelhidden3/biasoutput/kerneloutput/bias*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������**
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8� *.
f)R'
%__inference_signature_wrapper_8174363
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
�
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename"hidden1/kernel/Read/ReadVariableOp hidden1/bias/Read/ReadVariableOp"hidden2/kernel/Read/ReadVariableOp hidden2/bias/Read/ReadVariableOp"hidden3/kernel/Read/ReadVariableOp hidden3/bias/Read/ReadVariableOp!output/kernel/Read/ReadVariableOpoutput/bias/Read/ReadVariableOpAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOp"true_positives/Read/ReadVariableOp"true_negatives/Read/ReadVariableOp#false_positives/Read/ReadVariableOp#false_negatives/Read/ReadVariableOp$true_positives_1/Read/ReadVariableOp%false_negatives_1/Read/ReadVariableOp$true_positives_2/Read/ReadVariableOp%false_positives_1/Read/ReadVariableOp$true_positives_3/Read/ReadVariableOp$true_negatives_1/Read/ReadVariableOp%false_positives_2/Read/ReadVariableOp%false_negatives_2/Read/ReadVariableOp)Adam/hidden1/kernel/m/Read/ReadVariableOp'Adam/hidden1/bias/m/Read/ReadVariableOp)Adam/hidden2/kernel/m/Read/ReadVariableOp'Adam/hidden2/bias/m/Read/ReadVariableOp)Adam/hidden3/kernel/m/Read/ReadVariableOp'Adam/hidden3/bias/m/Read/ReadVariableOp(Adam/output/kernel/m/Read/ReadVariableOp&Adam/output/bias/m/Read/ReadVariableOp)Adam/hidden1/kernel/v/Read/ReadVariableOp'Adam/hidden1/bias/v/Read/ReadVariableOp)Adam/hidden2/kernel/v/Read/ReadVariableOp'Adam/hidden2/bias/v/Read/ReadVariableOp)Adam/hidden3/kernel/v/Read/ReadVariableOp'Adam/hidden3/bias/v/Read/ReadVariableOp(Adam/output/kernel/v/Read/ReadVariableOp&Adam/output/bias/v/Read/ReadVariableOpConst*8
Tin1
/2-	*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *)
f$R"
 __inference__traced_save_8174914
�
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenamehidden1/kernelhidden1/biashidden2/kernelhidden2/biashidden3/kernelhidden3/biasoutput/kerneloutput/bias	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_ratetotalcounttrue_positivestrue_negativesfalse_positivesfalse_negativestrue_positives_1false_negatives_1true_positives_2false_positives_1true_positives_3true_negatives_1false_positives_2false_negatives_2Adam/hidden1/kernel/mAdam/hidden1/bias/mAdam/hidden2/kernel/mAdam/hidden2/bias/mAdam/hidden3/kernel/mAdam/hidden3/bias/mAdam/output/kernel/mAdam/output/bias/mAdam/hidden1/kernel/vAdam/hidden1/bias/vAdam/hidden2/kernel/vAdam/hidden2/bias/vAdam/hidden3/kernel/vAdam/hidden3/bias/vAdam/output/kernel/vAdam/output/bias/v*7
Tin0
.2,*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *,
f'R%
#__inference__traced_restore_8175053��	
η
�
#__inference__traced_restore_8175053
file_prefix2
assignvariableop_hidden1_kernel:	�.
assignvariableop_1_hidden1_bias:	�5
!assignvariableop_2_hidden2_kernel:
��.
assignvariableop_3_hidden2_bias:	�5
!assignvariableop_4_hidden3_kernel:
��.
assignvariableop_5_hidden3_bias:	�3
 assignvariableop_6_output_kernel:	�,
assignvariableop_7_output_bias:&
assignvariableop_8_adam_iter:	 (
assignvariableop_9_adam_beta_1: )
assignvariableop_10_adam_beta_2: (
assignvariableop_11_adam_decay: 0
&assignvariableop_12_adam_learning_rate: #
assignvariableop_13_total: #
assignvariableop_14_count: 1
"assignvariableop_15_true_positives:	�1
"assignvariableop_16_true_negatives:	�2
#assignvariableop_17_false_positives:	�2
#assignvariableop_18_false_negatives:	�2
$assignvariableop_19_true_positives_1:3
%assignvariableop_20_false_negatives_1:2
$assignvariableop_21_true_positives_2:3
%assignvariableop_22_false_positives_1:3
$assignvariableop_23_true_positives_3:	�3
$assignvariableop_24_true_negatives_1:	�4
%assignvariableop_25_false_positives_2:	�4
%assignvariableop_26_false_negatives_2:	�<
)assignvariableop_27_adam_hidden1_kernel_m:	�6
'assignvariableop_28_adam_hidden1_bias_m:	�=
)assignvariableop_29_adam_hidden2_kernel_m:
��6
'assignvariableop_30_adam_hidden2_bias_m:	�=
)assignvariableop_31_adam_hidden3_kernel_m:
��6
'assignvariableop_32_adam_hidden3_bias_m:	�;
(assignvariableop_33_adam_output_kernel_m:	�4
&assignvariableop_34_adam_output_bias_m:<
)assignvariableop_35_adam_hidden1_kernel_v:	�6
'assignvariableop_36_adam_hidden1_bias_v:	�=
)assignvariableop_37_adam_hidden2_kernel_v:
��6
'assignvariableop_38_adam_hidden2_bias_v:	�=
)assignvariableop_39_adam_hidden3_kernel_v:
��6
'assignvariableop_40_adam_hidden3_bias_v:	�;
(assignvariableop_41_adam_output_kernel_v:	�4
&assignvariableop_42_adam_output_bias_v:
identity_44��AssignVariableOp�AssignVariableOp_1�AssignVariableOp_10�AssignVariableOp_11�AssignVariableOp_12�AssignVariableOp_13�AssignVariableOp_14�AssignVariableOp_15�AssignVariableOp_16�AssignVariableOp_17�AssignVariableOp_18�AssignVariableOp_19�AssignVariableOp_2�AssignVariableOp_20�AssignVariableOp_21�AssignVariableOp_22�AssignVariableOp_23�AssignVariableOp_24�AssignVariableOp_25�AssignVariableOp_26�AssignVariableOp_27�AssignVariableOp_28�AssignVariableOp_29�AssignVariableOp_3�AssignVariableOp_30�AssignVariableOp_31�AssignVariableOp_32�AssignVariableOp_33�AssignVariableOp_34�AssignVariableOp_35�AssignVariableOp_36�AssignVariableOp_37�AssignVariableOp_38�AssignVariableOp_39�AssignVariableOp_4�AssignVariableOp_40�AssignVariableOp_41�AssignVariableOp_42�AssignVariableOp_5�AssignVariableOp_6�AssignVariableOp_7�AssignVariableOp_8�AssignVariableOp_9�
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:,*
dtype0*�
value�B�,B6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB=keras_api/metrics/1/true_positives/.ATTRIBUTES/VARIABLE_VALUEB=keras_api/metrics/1/true_negatives/.ATTRIBUTES/VARIABLE_VALUEB>keras_api/metrics/1/false_positives/.ATTRIBUTES/VARIABLE_VALUEB>keras_api/metrics/1/false_negatives/.ATTRIBUTES/VARIABLE_VALUEB=keras_api/metrics/2/true_positives/.ATTRIBUTES/VARIABLE_VALUEB>keras_api/metrics/2/false_negatives/.ATTRIBUTES/VARIABLE_VALUEB=keras_api/metrics/3/true_positives/.ATTRIBUTES/VARIABLE_VALUEB>keras_api/metrics/3/false_positives/.ATTRIBUTES/VARIABLE_VALUEB=keras_api/metrics/4/true_positives/.ATTRIBUTES/VARIABLE_VALUEB=keras_api/metrics/4/true_negatives/.ATTRIBUTES/VARIABLE_VALUEB>keras_api/metrics/4/false_positives/.ATTRIBUTES/VARIABLE_VALUEB>keras_api/metrics/4/false_negatives/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
RestoreV2/tensor_names�
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:,*
dtype0*k
valuebB`,B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B 2
RestoreV2/shape_and_slices�
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*�
_output_shapes�
�::::::::::::::::::::::::::::::::::::::::::::*:
dtypes0
.2,	2
	RestoreV2g
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:2

Identity�
AssignVariableOpAssignVariableOpassignvariableop_hidden1_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOpk

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:2

Identity_1�
AssignVariableOp_1AssignVariableOpassignvariableop_1_hidden1_biasIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_1k

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:2

Identity_2�
AssignVariableOp_2AssignVariableOp!assignvariableop_2_hidden2_kernelIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_2k

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:2

Identity_3�
AssignVariableOp_3AssignVariableOpassignvariableop_3_hidden2_biasIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_3k

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:2

Identity_4�
AssignVariableOp_4AssignVariableOp!assignvariableop_4_hidden3_kernelIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_4k

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:2

Identity_5�
AssignVariableOp_5AssignVariableOpassignvariableop_5_hidden3_biasIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_5k

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:2

Identity_6�
AssignVariableOp_6AssignVariableOp assignvariableop_6_output_kernelIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_6k

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:2

Identity_7�
AssignVariableOp_7AssignVariableOpassignvariableop_7_output_biasIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_7k

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0	*
_output_shapes
:2

Identity_8�
AssignVariableOp_8AssignVariableOpassignvariableop_8_adam_iterIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	2
AssignVariableOp_8k

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:2

Identity_9�
AssignVariableOp_9AssignVariableOpassignvariableop_9_adam_beta_1Identity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_9n
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:2
Identity_10�
AssignVariableOp_10AssignVariableOpassignvariableop_10_adam_beta_2Identity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_10n
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:2
Identity_11�
AssignVariableOp_11AssignVariableOpassignvariableop_11_adam_decayIdentity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_11n
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:2
Identity_12�
AssignVariableOp_12AssignVariableOp&assignvariableop_12_adam_learning_rateIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_12n
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:2
Identity_13�
AssignVariableOp_13AssignVariableOpassignvariableop_13_totalIdentity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_13n
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:2
Identity_14�
AssignVariableOp_14AssignVariableOpassignvariableop_14_countIdentity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_14n
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:2
Identity_15�
AssignVariableOp_15AssignVariableOp"assignvariableop_15_true_positivesIdentity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_15n
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:2
Identity_16�
AssignVariableOp_16AssignVariableOp"assignvariableop_16_true_negativesIdentity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_16n
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:2
Identity_17�
AssignVariableOp_17AssignVariableOp#assignvariableop_17_false_positivesIdentity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_17n
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:2
Identity_18�
AssignVariableOp_18AssignVariableOp#assignvariableop_18_false_negativesIdentity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_18n
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:2
Identity_19�
AssignVariableOp_19AssignVariableOp$assignvariableop_19_true_positives_1Identity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_19n
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:2
Identity_20�
AssignVariableOp_20AssignVariableOp%assignvariableop_20_false_negatives_1Identity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_20n
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:2
Identity_21�
AssignVariableOp_21AssignVariableOp$assignvariableop_21_true_positives_2Identity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_21n
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:2
Identity_22�
AssignVariableOp_22AssignVariableOp%assignvariableop_22_false_positives_1Identity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_22n
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:2
Identity_23�
AssignVariableOp_23AssignVariableOp$assignvariableop_23_true_positives_3Identity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_23n
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:2
Identity_24�
AssignVariableOp_24AssignVariableOp$assignvariableop_24_true_negatives_1Identity_24:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_24n
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:2
Identity_25�
AssignVariableOp_25AssignVariableOp%assignvariableop_25_false_positives_2Identity_25:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_25n
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:2
Identity_26�
AssignVariableOp_26AssignVariableOp%assignvariableop_26_false_negatives_2Identity_26:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_26n
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0*
_output_shapes
:2
Identity_27�
AssignVariableOp_27AssignVariableOp)assignvariableop_27_adam_hidden1_kernel_mIdentity_27:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_27n
Identity_28IdentityRestoreV2:tensors:28"/device:CPU:0*
T0*
_output_shapes
:2
Identity_28�
AssignVariableOp_28AssignVariableOp'assignvariableop_28_adam_hidden1_bias_mIdentity_28:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_28n
Identity_29IdentityRestoreV2:tensors:29"/device:CPU:0*
T0*
_output_shapes
:2
Identity_29�
AssignVariableOp_29AssignVariableOp)assignvariableop_29_adam_hidden2_kernel_mIdentity_29:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_29n
Identity_30IdentityRestoreV2:tensors:30"/device:CPU:0*
T0*
_output_shapes
:2
Identity_30�
AssignVariableOp_30AssignVariableOp'assignvariableop_30_adam_hidden2_bias_mIdentity_30:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_30n
Identity_31IdentityRestoreV2:tensors:31"/device:CPU:0*
T0*
_output_shapes
:2
Identity_31�
AssignVariableOp_31AssignVariableOp)assignvariableop_31_adam_hidden3_kernel_mIdentity_31:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_31n
Identity_32IdentityRestoreV2:tensors:32"/device:CPU:0*
T0*
_output_shapes
:2
Identity_32�
AssignVariableOp_32AssignVariableOp'assignvariableop_32_adam_hidden3_bias_mIdentity_32:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_32n
Identity_33IdentityRestoreV2:tensors:33"/device:CPU:0*
T0*
_output_shapes
:2
Identity_33�
AssignVariableOp_33AssignVariableOp(assignvariableop_33_adam_output_kernel_mIdentity_33:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_33n
Identity_34IdentityRestoreV2:tensors:34"/device:CPU:0*
T0*
_output_shapes
:2
Identity_34�
AssignVariableOp_34AssignVariableOp&assignvariableop_34_adam_output_bias_mIdentity_34:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_34n
Identity_35IdentityRestoreV2:tensors:35"/device:CPU:0*
T0*
_output_shapes
:2
Identity_35�
AssignVariableOp_35AssignVariableOp)assignvariableop_35_adam_hidden1_kernel_vIdentity_35:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_35n
Identity_36IdentityRestoreV2:tensors:36"/device:CPU:0*
T0*
_output_shapes
:2
Identity_36�
AssignVariableOp_36AssignVariableOp'assignvariableop_36_adam_hidden1_bias_vIdentity_36:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_36n
Identity_37IdentityRestoreV2:tensors:37"/device:CPU:0*
T0*
_output_shapes
:2
Identity_37�
AssignVariableOp_37AssignVariableOp)assignvariableop_37_adam_hidden2_kernel_vIdentity_37:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_37n
Identity_38IdentityRestoreV2:tensors:38"/device:CPU:0*
T0*
_output_shapes
:2
Identity_38�
AssignVariableOp_38AssignVariableOp'assignvariableop_38_adam_hidden2_bias_vIdentity_38:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_38n
Identity_39IdentityRestoreV2:tensors:39"/device:CPU:0*
T0*
_output_shapes
:2
Identity_39�
AssignVariableOp_39AssignVariableOp)assignvariableop_39_adam_hidden3_kernel_vIdentity_39:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_39n
Identity_40IdentityRestoreV2:tensors:40"/device:CPU:0*
T0*
_output_shapes
:2
Identity_40�
AssignVariableOp_40AssignVariableOp'assignvariableop_40_adam_hidden3_bias_vIdentity_40:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_40n
Identity_41IdentityRestoreV2:tensors:41"/device:CPU:0*
T0*
_output_shapes
:2
Identity_41�
AssignVariableOp_41AssignVariableOp(assignvariableop_41_adam_output_kernel_vIdentity_41:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_41n
Identity_42IdentityRestoreV2:tensors:42"/device:CPU:0*
T0*
_output_shapes
:2
Identity_42�
AssignVariableOp_42AssignVariableOp&assignvariableop_42_adam_output_bias_vIdentity_42:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_429
NoOpNoOp"/device:CPU:0*
_output_shapes
 2
NoOp�
Identity_43Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: 2
Identity_43f
Identity_44IdentityIdentity_43:output:0^NoOp_1*
T0*
_output_shapes
: 2
Identity_44�
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 2
NoOp_1"#
identity_44Identity_44:output:0*k
_input_shapesZ
X: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232*
AssignVariableOp_24AssignVariableOp_242*
AssignVariableOp_25AssignVariableOp_252*
AssignVariableOp_26AssignVariableOp_262*
AssignVariableOp_27AssignVariableOp_272*
AssignVariableOp_28AssignVariableOp_282*
AssignVariableOp_29AssignVariableOp_292(
AssignVariableOp_3AssignVariableOp_32*
AssignVariableOp_30AssignVariableOp_302*
AssignVariableOp_31AssignVariableOp_312*
AssignVariableOp_32AssignVariableOp_322*
AssignVariableOp_33AssignVariableOp_332*
AssignVariableOp_34AssignVariableOp_342*
AssignVariableOp_35AssignVariableOp_352*
AssignVariableOp_36AssignVariableOp_362*
AssignVariableOp_37AssignVariableOp_372*
AssignVariableOp_38AssignVariableOp_382*
AssignVariableOp_39AssignVariableOp_392(
AssignVariableOp_4AssignVariableOp_42*
AssignVariableOp_40AssignVariableOp_402*
AssignVariableOp_41AssignVariableOp_412*
AssignVariableOp_42AssignVariableOp_422(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
�
�
D__inference_hidden1_layer_call_and_return_conditional_losses_8174555

inputs1
matmul_readvariableop_resource:	�.
biasadd_readvariableop_resource:	�
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�0hidden1/kernel/Regularizer/Square/ReadVariableOp�
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������2
MatMul�
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:�*
dtype02
BiasAdd/ReadVariableOp�
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������2	
BiasAddY
ReluReluBiasAdd:output:0*
T0*(
_output_shapes
:����������2
Relu�
0hidden1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�*
dtype022
0hidden1/kernel/Regularizer/Square/ReadVariableOp�
!hidden1/kernel/Regularizer/SquareSquare8hidden1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	�2#
!hidden1/kernel/Regularizer/Square�
 hidden1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2"
 hidden1/kernel/Regularizer/Const�
hidden1/kernel/Regularizer/SumSum%hidden1/kernel/Regularizer/Square:y:0)hidden1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2 
hidden1/kernel/Regularizer/Sum�
 hidden1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��'72"
 hidden1/kernel/Regularizer/mul/x�
hidden1/kernel/Regularizer/mulMul)hidden1/kernel/Regularizer/mul/x:output:0'hidden1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2 
hidden1/kernel/Regularizer/muln
IdentityIdentityRelu:activations:0^NoOp*
T0*(
_output_shapes
:����������2

Identity�
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp1^hidden1/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2d
0hidden1/kernel/Regularizer/Square/ReadVariableOp0hidden1/kernel/Regularizer/Square/ReadVariableOp:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
b
D__inference_dropout_layer_call_and_return_conditional_losses_8173892

inputs

identity_1[
IdentityIdentityinputs*
T0*(
_output_shapes
:����������2

Identityj

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:����������2

Identity_1"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
D__inference_hidden2_layer_call_and_return_conditional_losses_8173911

inputs2
matmul_readvariableop_resource:
��.
biasadd_readvariableop_resource:	�
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�0hidden2/kernel/Regularizer/Square/ReadVariableOp�
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
��*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������2
MatMul�
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:�*
dtype02
BiasAdd/ReadVariableOp�
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������2	
BiasAddY
ReluReluBiasAdd:output:0*
T0*(
_output_shapes
:����������2
Relu�
0hidden2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
��*
dtype022
0hidden2/kernel/Regularizer/Square/ReadVariableOp�
!hidden2/kernel/Regularizer/SquareSquare8hidden2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
��2#
!hidden2/kernel/Regularizer/Square�
 hidden2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2"
 hidden2/kernel/Regularizer/Const�
hidden2/kernel/Regularizer/SumSum%hidden2/kernel/Regularizer/Square:y:0)hidden2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2 
hidden2/kernel/Regularizer/Sum�
 hidden2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��'72"
 hidden2/kernel/Regularizer/mul/x�
hidden2/kernel/Regularizer/mulMul)hidden2/kernel/Regularizer/mul/x:output:0'hidden2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2 
hidden2/kernel/Regularizer/muln
IdentityIdentityRelu:activations:0^NoOp*
T0*(
_output_shapes
:����������2

Identity�
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp1^hidden2/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2d
0hidden2/kernel/Regularizer/Square/ReadVariableOp0hidden2/kernel/Regularizer/Square/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
E
)__inference_dropout_layer_call_fn_8174586

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_dropout_layer_call_and_return_conditional_losses_81738922
PartitionedCallm
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:����������2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
c
D__inference_dropout_layer_call_and_return_conditional_losses_8174105

inputs
identity�c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @2
dropout/Constt
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:����������2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape�
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:����������*
dtype0*
seed��2&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?2
dropout/GreaterEqual/y�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:����������2
dropout/GreaterEqual�
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:����������2
dropout/Cast{
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:����������2
dropout/Mul_1f
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:����������2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
D__inference_hidden3_layer_call_and_return_conditional_losses_8173941

inputs2
matmul_readvariableop_resource:
��.
biasadd_readvariableop_resource:	�
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�0hidden3/kernel/Regularizer/Square/ReadVariableOp�
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
��*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������2
MatMul�
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:�*
dtype02
BiasAdd/ReadVariableOp�
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������2	
BiasAddY
ReluReluBiasAdd:output:0*
T0*(
_output_shapes
:����������2
Relu�
0hidden3/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
��*
dtype022
0hidden3/kernel/Regularizer/Square/ReadVariableOp�
!hidden3/kernel/Regularizer/SquareSquare8hidden3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
��2#
!hidden3/kernel/Regularizer/Square�
 hidden3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2"
 hidden3/kernel/Regularizer/Const�
hidden3/kernel/Regularizer/SumSum%hidden3/kernel/Regularizer/Square:y:0)hidden3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2 
hidden3/kernel/Regularizer/Sum�
 hidden3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��'72"
 hidden3/kernel/Regularizer/mul/x�
hidden3/kernel/Regularizer/mulMul)hidden3/kernel/Regularizer/mul/x:output:0'hidden3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2 
hidden3/kernel/Regularizer/muln
IdentityIdentityRelu:activations:0^NoOp*
T0*(
_output_shapes
:����������2

Identity�
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp1^hidden3/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2d
0hidden3/kernel/Regularizer/Square/ReadVariableOp0hidden3/kernel/Regularizer/Square/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�	
�
%__inference_signature_wrapper_8174363
hidden1_input
unknown:	�
	unknown_0:	�
	unknown_1:
��
	unknown_2:	�
	unknown_3:
��
	unknown_4:	�
	unknown_5:	�
	unknown_6:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallhidden1_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������**
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8� *+
f&R$
"__inference__wrapped_model_81738572
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:V R
'
_output_shapes
:���������
'
_user_specified_namehidden1_input
�
e
F__inference_dropout_2_layer_call_and_return_conditional_losses_8174699

inputs
identity�c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @2
dropout/Constt
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:����������2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape�
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:����������*
dtype0*
seed��2&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?2
dropout/GreaterEqual/y�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:����������2
dropout/GreaterEqual�
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:����������2
dropout/Cast{
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:����������2
dropout/Mul_1f
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:����������2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
C__inference_output_layer_call_and_return_conditional_losses_8174720

inputs1
matmul_readvariableop_resource:	�-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
MatMul�
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp�
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2	
BiasAdda
SigmoidSigmoidBiasAdd:output:0*
T0*'
_output_shapes
:���������2	
Sigmoidf
IdentityIdentitySigmoid:y:0^NoOp*
T0*'
_output_shapes
:���������2

Identity
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�=
�
G__inference_sequential_layer_call_and_return_conditional_losses_8174271
hidden1_input"
hidden1_8174229:	�
hidden1_8174231:	�#
hidden2_8174235:
��
hidden2_8174237:	�#
hidden3_8174241:
��
hidden3_8174243:	�!
output_8174247:	�
output_8174249:
identity��hidden1/StatefulPartitionedCall�0hidden1/kernel/Regularizer/Square/ReadVariableOp�hidden2/StatefulPartitionedCall�0hidden2/kernel/Regularizer/Square/ReadVariableOp�hidden3/StatefulPartitionedCall�0hidden3/kernel/Regularizer/Square/ReadVariableOp�output/StatefulPartitionedCall�
hidden1/StatefulPartitionedCallStatefulPartitionedCallhidden1_inputhidden1_8174229hidden1_8174231*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_hidden1_layer_call_and_return_conditional_losses_81738812!
hidden1/StatefulPartitionedCall�
dropout/PartitionedCallPartitionedCall(hidden1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_dropout_layer_call_and_return_conditional_losses_81738922
dropout/PartitionedCall�
hidden2/StatefulPartitionedCallStatefulPartitionedCall dropout/PartitionedCall:output:0hidden2_8174235hidden2_8174237*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_hidden2_layer_call_and_return_conditional_losses_81739112!
hidden2/StatefulPartitionedCall�
dropout_1/PartitionedCallPartitionedCall(hidden2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *O
fJRH
F__inference_dropout_1_layer_call_and_return_conditional_losses_81739222
dropout_1/PartitionedCall�
hidden3/StatefulPartitionedCallStatefulPartitionedCall"dropout_1/PartitionedCall:output:0hidden3_8174241hidden3_8174243*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_hidden3_layer_call_and_return_conditional_losses_81739412!
hidden3/StatefulPartitionedCall�
dropout_2/PartitionedCallPartitionedCall(hidden3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *O
fJRH
F__inference_dropout_2_layer_call_and_return_conditional_losses_81739522
dropout_2/PartitionedCall�
output/StatefulPartitionedCallStatefulPartitionedCall"dropout_2/PartitionedCall:output:0output_8174247output_8174249*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_output_layer_call_and_return_conditional_losses_81739652 
output/StatefulPartitionedCall�
0hidden1/kernel/Regularizer/Square/ReadVariableOpReadVariableOphidden1_8174229*
_output_shapes
:	�*
dtype022
0hidden1/kernel/Regularizer/Square/ReadVariableOp�
!hidden1/kernel/Regularizer/SquareSquare8hidden1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	�2#
!hidden1/kernel/Regularizer/Square�
 hidden1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2"
 hidden1/kernel/Regularizer/Const�
hidden1/kernel/Regularizer/SumSum%hidden1/kernel/Regularizer/Square:y:0)hidden1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2 
hidden1/kernel/Regularizer/Sum�
 hidden1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��'72"
 hidden1/kernel/Regularizer/mul/x�
hidden1/kernel/Regularizer/mulMul)hidden1/kernel/Regularizer/mul/x:output:0'hidden1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2 
hidden1/kernel/Regularizer/mul�
0hidden2/kernel/Regularizer/Square/ReadVariableOpReadVariableOphidden2_8174235* 
_output_shapes
:
��*
dtype022
0hidden2/kernel/Regularizer/Square/ReadVariableOp�
!hidden2/kernel/Regularizer/SquareSquare8hidden2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
��2#
!hidden2/kernel/Regularizer/Square�
 hidden2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2"
 hidden2/kernel/Regularizer/Const�
hidden2/kernel/Regularizer/SumSum%hidden2/kernel/Regularizer/Square:y:0)hidden2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2 
hidden2/kernel/Regularizer/Sum�
 hidden2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��'72"
 hidden2/kernel/Regularizer/mul/x�
hidden2/kernel/Regularizer/mulMul)hidden2/kernel/Regularizer/mul/x:output:0'hidden2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2 
hidden2/kernel/Regularizer/mul�
0hidden3/kernel/Regularizer/Square/ReadVariableOpReadVariableOphidden3_8174241* 
_output_shapes
:
��*
dtype022
0hidden3/kernel/Regularizer/Square/ReadVariableOp�
!hidden3/kernel/Regularizer/SquareSquare8hidden3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
��2#
!hidden3/kernel/Regularizer/Square�
 hidden3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2"
 hidden3/kernel/Regularizer/Const�
hidden3/kernel/Regularizer/SumSum%hidden3/kernel/Regularizer/Square:y:0)hidden3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2 
hidden3/kernel/Regularizer/Sum�
 hidden3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��'72"
 hidden3/kernel/Regularizer/mul/x�
hidden3/kernel/Regularizer/mulMul)hidden3/kernel/Regularizer/mul/x:output:0'hidden3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2 
hidden3/kernel/Regularizer/mul�
IdentityIdentity'output/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������2

Identity�
NoOpNoOp ^hidden1/StatefulPartitionedCall1^hidden1/kernel/Regularizer/Square/ReadVariableOp ^hidden2/StatefulPartitionedCall1^hidden2/kernel/Regularizer/Square/ReadVariableOp ^hidden3/StatefulPartitionedCall1^hidden3/kernel/Regularizer/Square/ReadVariableOp^output/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������: : : : : : : : 2B
hidden1/StatefulPartitionedCallhidden1/StatefulPartitionedCall2d
0hidden1/kernel/Regularizer/Square/ReadVariableOp0hidden1/kernel/Regularizer/Square/ReadVariableOp2B
hidden2/StatefulPartitionedCallhidden2/StatefulPartitionedCall2d
0hidden2/kernel/Regularizer/Square/ReadVariableOp0hidden2/kernel/Regularizer/Square/ReadVariableOp2B
hidden3/StatefulPartitionedCallhidden3/StatefulPartitionedCall2d
0hidden3/kernel/Regularizer/Square/ReadVariableOp0hidden3/kernel/Regularizer/Square/ReadVariableOp2@
output/StatefulPartitionedCalloutput/StatefulPartitionedCall:V R
'
_output_shapes
:���������
'
_user_specified_namehidden1_input
�
d
F__inference_dropout_2_layer_call_and_return_conditional_losses_8173952

inputs

identity_1[
IdentityIdentityinputs*
T0*(
_output_shapes
:����������2

Identityj

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:����������2

Identity_1"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
__inference_loss_fn_0_8174740L
9hidden1_kernel_regularizer_square_readvariableop_resource:	�
identity��0hidden1/kernel/Regularizer/Square/ReadVariableOp�
0hidden1/kernel/Regularizer/Square/ReadVariableOpReadVariableOp9hidden1_kernel_regularizer_square_readvariableop_resource*
_output_shapes
:	�*
dtype022
0hidden1/kernel/Regularizer/Square/ReadVariableOp�
!hidden1/kernel/Regularizer/SquareSquare8hidden1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	�2#
!hidden1/kernel/Regularizer/Square�
 hidden1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2"
 hidden1/kernel/Regularizer/Const�
hidden1/kernel/Regularizer/SumSum%hidden1/kernel/Regularizer/Square:y:0)hidden1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2 
hidden1/kernel/Regularizer/Sum�
 hidden1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��'72"
 hidden1/kernel/Regularizer/mul/x�
hidden1/kernel/Regularizer/mulMul)hidden1/kernel/Regularizer/mul/x:output:0'hidden1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2 
hidden1/kernel/Regularizer/mull
IdentityIdentity"hidden1/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: 2

Identity�
NoOpNoOp1^hidden1/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2d
0hidden1/kernel/Regularizer/Square/ReadVariableOp0hidden1/kernel/Regularizer/Square/ReadVariableOp
�d
�
G__inference_sequential_layer_call_and_return_conditional_losses_8174490

inputs9
&hidden1_matmul_readvariableop_resource:	�6
'hidden1_biasadd_readvariableop_resource:	�:
&hidden2_matmul_readvariableop_resource:
��6
'hidden2_biasadd_readvariableop_resource:	�:
&hidden3_matmul_readvariableop_resource:
��6
'hidden3_biasadd_readvariableop_resource:	�8
%output_matmul_readvariableop_resource:	�4
&output_biasadd_readvariableop_resource:
identity��hidden1/BiasAdd/ReadVariableOp�hidden1/MatMul/ReadVariableOp�0hidden1/kernel/Regularizer/Square/ReadVariableOp�hidden2/BiasAdd/ReadVariableOp�hidden2/MatMul/ReadVariableOp�0hidden2/kernel/Regularizer/Square/ReadVariableOp�hidden3/BiasAdd/ReadVariableOp�hidden3/MatMul/ReadVariableOp�0hidden3/kernel/Regularizer/Square/ReadVariableOp�output/BiasAdd/ReadVariableOp�output/MatMul/ReadVariableOp�
hidden1/MatMul/ReadVariableOpReadVariableOp&hidden1_matmul_readvariableop_resource*
_output_shapes
:	�*
dtype02
hidden1/MatMul/ReadVariableOp�
hidden1/MatMulMatMulinputs%hidden1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������2
hidden1/MatMul�
hidden1/BiasAdd/ReadVariableOpReadVariableOp'hidden1_biasadd_readvariableop_resource*
_output_shapes	
:�*
dtype02 
hidden1/BiasAdd/ReadVariableOp�
hidden1/BiasAddBiasAddhidden1/MatMul:product:0&hidden1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������2
hidden1/BiasAddq
hidden1/ReluReluhidden1/BiasAdd:output:0*
T0*(
_output_shapes
:����������2
hidden1/Relus
dropout/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @2
dropout/dropout/Const�
dropout/dropout/MulMulhidden1/Relu:activations:0dropout/dropout/Const:output:0*
T0*(
_output_shapes
:����������2
dropout/dropout/Mulx
dropout/dropout/ShapeShapehidden1/Relu:activations:0*
T0*
_output_shapes
:2
dropout/dropout/Shape�
,dropout/dropout/random_uniform/RandomUniformRandomUniformdropout/dropout/Shape:output:0*
T0*(
_output_shapes
:����������*
dtype0*
seed��2.
,dropout/dropout/random_uniform/RandomUniform�
dropout/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?2 
dropout/dropout/GreaterEqual/y�
dropout/dropout/GreaterEqualGreaterEqual5dropout/dropout/random_uniform/RandomUniform:output:0'dropout/dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:����������2
dropout/dropout/GreaterEqual�
dropout/dropout/CastCast dropout/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:����������2
dropout/dropout/Cast�
dropout/dropout/Mul_1Muldropout/dropout/Mul:z:0dropout/dropout/Cast:y:0*
T0*(
_output_shapes
:����������2
dropout/dropout/Mul_1�
hidden2/MatMul/ReadVariableOpReadVariableOp&hidden2_matmul_readvariableop_resource* 
_output_shapes
:
��*
dtype02
hidden2/MatMul/ReadVariableOp�
hidden2/MatMulMatMuldropout/dropout/Mul_1:z:0%hidden2/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������2
hidden2/MatMul�
hidden2/BiasAdd/ReadVariableOpReadVariableOp'hidden2_biasadd_readvariableop_resource*
_output_shapes	
:�*
dtype02 
hidden2/BiasAdd/ReadVariableOp�
hidden2/BiasAddBiasAddhidden2/MatMul:product:0&hidden2/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������2
hidden2/BiasAddq
hidden2/ReluReluhidden2/BiasAdd:output:0*
T0*(
_output_shapes
:����������2
hidden2/Reluw
dropout_1/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @2
dropout_1/dropout/Const�
dropout_1/dropout/MulMulhidden2/Relu:activations:0 dropout_1/dropout/Const:output:0*
T0*(
_output_shapes
:����������2
dropout_1/dropout/Mul|
dropout_1/dropout/ShapeShapehidden2/Relu:activations:0*
T0*
_output_shapes
:2
dropout_1/dropout/Shape�
.dropout_1/dropout/random_uniform/RandomUniformRandomUniform dropout_1/dropout/Shape:output:0*
T0*(
_output_shapes
:����������*
dtype0*
seed��*
seed220
.dropout_1/dropout/random_uniform/RandomUniform�
 dropout_1/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?2"
 dropout_1/dropout/GreaterEqual/y�
dropout_1/dropout/GreaterEqualGreaterEqual7dropout_1/dropout/random_uniform/RandomUniform:output:0)dropout_1/dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:����������2 
dropout_1/dropout/GreaterEqual�
dropout_1/dropout/CastCast"dropout_1/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:����������2
dropout_1/dropout/Cast�
dropout_1/dropout/Mul_1Muldropout_1/dropout/Mul:z:0dropout_1/dropout/Cast:y:0*
T0*(
_output_shapes
:����������2
dropout_1/dropout/Mul_1�
hidden3/MatMul/ReadVariableOpReadVariableOp&hidden3_matmul_readvariableop_resource* 
_output_shapes
:
��*
dtype02
hidden3/MatMul/ReadVariableOp�
hidden3/MatMulMatMuldropout_1/dropout/Mul_1:z:0%hidden3/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������2
hidden3/MatMul�
hidden3/BiasAdd/ReadVariableOpReadVariableOp'hidden3_biasadd_readvariableop_resource*
_output_shapes	
:�*
dtype02 
hidden3/BiasAdd/ReadVariableOp�
hidden3/BiasAddBiasAddhidden3/MatMul:product:0&hidden3/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������2
hidden3/BiasAddq
hidden3/ReluReluhidden3/BiasAdd:output:0*
T0*(
_output_shapes
:����������2
hidden3/Reluw
dropout_2/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @2
dropout_2/dropout/Const�
dropout_2/dropout/MulMulhidden3/Relu:activations:0 dropout_2/dropout/Const:output:0*
T0*(
_output_shapes
:����������2
dropout_2/dropout/Mul|
dropout_2/dropout/ShapeShapehidden3/Relu:activations:0*
T0*
_output_shapes
:2
dropout_2/dropout/Shape�
.dropout_2/dropout/random_uniform/RandomUniformRandomUniform dropout_2/dropout/Shape:output:0*
T0*(
_output_shapes
:����������*
dtype0*
seed��*
seed220
.dropout_2/dropout/random_uniform/RandomUniform�
 dropout_2/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?2"
 dropout_2/dropout/GreaterEqual/y�
dropout_2/dropout/GreaterEqualGreaterEqual7dropout_2/dropout/random_uniform/RandomUniform:output:0)dropout_2/dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:����������2 
dropout_2/dropout/GreaterEqual�
dropout_2/dropout/CastCast"dropout_2/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:����������2
dropout_2/dropout/Cast�
dropout_2/dropout/Mul_1Muldropout_2/dropout/Mul:z:0dropout_2/dropout/Cast:y:0*
T0*(
_output_shapes
:����������2
dropout_2/dropout/Mul_1�
output/MatMul/ReadVariableOpReadVariableOp%output_matmul_readvariableop_resource*
_output_shapes
:	�*
dtype02
output/MatMul/ReadVariableOp�
output/MatMulMatMuldropout_2/dropout/Mul_1:z:0$output/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
output/MatMul�
output/BiasAdd/ReadVariableOpReadVariableOp&output_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02
output/BiasAdd/ReadVariableOp�
output/BiasAddBiasAddoutput/MatMul:product:0%output/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
output/BiasAddv
output/SigmoidSigmoidoutput/BiasAdd:output:0*
T0*'
_output_shapes
:���������2
output/Sigmoid�
0hidden1/kernel/Regularizer/Square/ReadVariableOpReadVariableOp&hidden1_matmul_readvariableop_resource*
_output_shapes
:	�*
dtype022
0hidden1/kernel/Regularizer/Square/ReadVariableOp�
!hidden1/kernel/Regularizer/SquareSquare8hidden1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	�2#
!hidden1/kernel/Regularizer/Square�
 hidden1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2"
 hidden1/kernel/Regularizer/Const�
hidden1/kernel/Regularizer/SumSum%hidden1/kernel/Regularizer/Square:y:0)hidden1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2 
hidden1/kernel/Regularizer/Sum�
 hidden1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��'72"
 hidden1/kernel/Regularizer/mul/x�
hidden1/kernel/Regularizer/mulMul)hidden1/kernel/Regularizer/mul/x:output:0'hidden1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2 
hidden1/kernel/Regularizer/mul�
0hidden2/kernel/Regularizer/Square/ReadVariableOpReadVariableOp&hidden2_matmul_readvariableop_resource* 
_output_shapes
:
��*
dtype022
0hidden2/kernel/Regularizer/Square/ReadVariableOp�
!hidden2/kernel/Regularizer/SquareSquare8hidden2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
��2#
!hidden2/kernel/Regularizer/Square�
 hidden2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2"
 hidden2/kernel/Regularizer/Const�
hidden2/kernel/Regularizer/SumSum%hidden2/kernel/Regularizer/Square:y:0)hidden2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2 
hidden2/kernel/Regularizer/Sum�
 hidden2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��'72"
 hidden2/kernel/Regularizer/mul/x�
hidden2/kernel/Regularizer/mulMul)hidden2/kernel/Regularizer/mul/x:output:0'hidden2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2 
hidden2/kernel/Regularizer/mul�
0hidden3/kernel/Regularizer/Square/ReadVariableOpReadVariableOp&hidden3_matmul_readvariableop_resource* 
_output_shapes
:
��*
dtype022
0hidden3/kernel/Regularizer/Square/ReadVariableOp�
!hidden3/kernel/Regularizer/SquareSquare8hidden3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
��2#
!hidden3/kernel/Regularizer/Square�
 hidden3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2"
 hidden3/kernel/Regularizer/Const�
hidden3/kernel/Regularizer/SumSum%hidden3/kernel/Regularizer/Square:y:0)hidden3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2 
hidden3/kernel/Regularizer/Sum�
 hidden3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��'72"
 hidden3/kernel/Regularizer/mul/x�
hidden3/kernel/Regularizer/mulMul)hidden3/kernel/Regularizer/mul/x:output:0'hidden3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2 
hidden3/kernel/Regularizer/mulm
IdentityIdentityoutput/Sigmoid:y:0^NoOp*
T0*'
_output_shapes
:���������2

Identity�
NoOpNoOp^hidden1/BiasAdd/ReadVariableOp^hidden1/MatMul/ReadVariableOp1^hidden1/kernel/Regularizer/Square/ReadVariableOp^hidden2/BiasAdd/ReadVariableOp^hidden2/MatMul/ReadVariableOp1^hidden2/kernel/Regularizer/Square/ReadVariableOp^hidden3/BiasAdd/ReadVariableOp^hidden3/MatMul/ReadVariableOp1^hidden3/kernel/Regularizer/Square/ReadVariableOp^output/BiasAdd/ReadVariableOp^output/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������: : : : : : : : 2@
hidden1/BiasAdd/ReadVariableOphidden1/BiasAdd/ReadVariableOp2>
hidden1/MatMul/ReadVariableOphidden1/MatMul/ReadVariableOp2d
0hidden1/kernel/Regularizer/Square/ReadVariableOp0hidden1/kernel/Regularizer/Square/ReadVariableOp2@
hidden2/BiasAdd/ReadVariableOphidden2/BiasAdd/ReadVariableOp2>
hidden2/MatMul/ReadVariableOphidden2/MatMul/ReadVariableOp2d
0hidden2/kernel/Regularizer/Square/ReadVariableOp0hidden2/kernel/Regularizer/Square/ReadVariableOp2@
hidden3/BiasAdd/ReadVariableOphidden3/BiasAdd/ReadVariableOp2>
hidden3/MatMul/ReadVariableOphidden3/MatMul/ReadVariableOp2d
0hidden3/kernel/Regularizer/Square/ReadVariableOp0hidden3/kernel/Regularizer/Square/ReadVariableOp2>
output/BiasAdd/ReadVariableOpoutput/BiasAdd/ReadVariableOp2<
output/MatMul/ReadVariableOpoutput/MatMul/ReadVariableOp:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
e
F__inference_dropout_1_layer_call_and_return_conditional_losses_8174072

inputs
identity�c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @2
dropout/Constt
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:����������2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape�
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:����������*
dtype0*
seed��2&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?2
dropout/GreaterEqual/y�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:����������2
dropout/GreaterEqual�
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:����������2
dropout/Cast{
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:����������2
dropout/Mul_1f
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:����������2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
e
F__inference_dropout_1_layer_call_and_return_conditional_losses_8174640

inputs
identity�c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @2
dropout/Constt
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:����������2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape�
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:����������*
dtype0*
seed��2&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?2
dropout/GreaterEqual/y�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:����������2
dropout/GreaterEqual�
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:����������2
dropout/Cast{
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:����������2
dropout/Mul_1f
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:����������2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�B
�
G__inference_sequential_layer_call_and_return_conditional_losses_8174186

inputs"
hidden1_8174144:	�
hidden1_8174146:	�#
hidden2_8174150:
��
hidden2_8174152:	�#
hidden3_8174156:
��
hidden3_8174158:	�!
output_8174162:	�
output_8174164:
identity��dropout/StatefulPartitionedCall�!dropout_1/StatefulPartitionedCall�!dropout_2/StatefulPartitionedCall�hidden1/StatefulPartitionedCall�0hidden1/kernel/Regularizer/Square/ReadVariableOp�hidden2/StatefulPartitionedCall�0hidden2/kernel/Regularizer/Square/ReadVariableOp�hidden3/StatefulPartitionedCall�0hidden3/kernel/Regularizer/Square/ReadVariableOp�output/StatefulPartitionedCall�
hidden1/StatefulPartitionedCallStatefulPartitionedCallinputshidden1_8174144hidden1_8174146*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_hidden1_layer_call_and_return_conditional_losses_81738812!
hidden1/StatefulPartitionedCall�
dropout/StatefulPartitionedCallStatefulPartitionedCall(hidden1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_dropout_layer_call_and_return_conditional_losses_81741052!
dropout/StatefulPartitionedCall�
hidden2/StatefulPartitionedCallStatefulPartitionedCall(dropout/StatefulPartitionedCall:output:0hidden2_8174150hidden2_8174152*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_hidden2_layer_call_and_return_conditional_losses_81739112!
hidden2/StatefulPartitionedCall�
!dropout_1/StatefulPartitionedCallStatefulPartitionedCall(hidden2/StatefulPartitionedCall:output:0 ^dropout/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *O
fJRH
F__inference_dropout_1_layer_call_and_return_conditional_losses_81740722#
!dropout_1/StatefulPartitionedCall�
hidden3/StatefulPartitionedCallStatefulPartitionedCall*dropout_1/StatefulPartitionedCall:output:0hidden3_8174156hidden3_8174158*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_hidden3_layer_call_and_return_conditional_losses_81739412!
hidden3/StatefulPartitionedCall�
!dropout_2/StatefulPartitionedCallStatefulPartitionedCall(hidden3/StatefulPartitionedCall:output:0"^dropout_1/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *O
fJRH
F__inference_dropout_2_layer_call_and_return_conditional_losses_81740392#
!dropout_2/StatefulPartitionedCall�
output/StatefulPartitionedCallStatefulPartitionedCall*dropout_2/StatefulPartitionedCall:output:0output_8174162output_8174164*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_output_layer_call_and_return_conditional_losses_81739652 
output/StatefulPartitionedCall�
0hidden1/kernel/Regularizer/Square/ReadVariableOpReadVariableOphidden1_8174144*
_output_shapes
:	�*
dtype022
0hidden1/kernel/Regularizer/Square/ReadVariableOp�
!hidden1/kernel/Regularizer/SquareSquare8hidden1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	�2#
!hidden1/kernel/Regularizer/Square�
 hidden1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2"
 hidden1/kernel/Regularizer/Const�
hidden1/kernel/Regularizer/SumSum%hidden1/kernel/Regularizer/Square:y:0)hidden1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2 
hidden1/kernel/Regularizer/Sum�
 hidden1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��'72"
 hidden1/kernel/Regularizer/mul/x�
hidden1/kernel/Regularizer/mulMul)hidden1/kernel/Regularizer/mul/x:output:0'hidden1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2 
hidden1/kernel/Regularizer/mul�
0hidden2/kernel/Regularizer/Square/ReadVariableOpReadVariableOphidden2_8174150* 
_output_shapes
:
��*
dtype022
0hidden2/kernel/Regularizer/Square/ReadVariableOp�
!hidden2/kernel/Regularizer/SquareSquare8hidden2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
��2#
!hidden2/kernel/Regularizer/Square�
 hidden2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2"
 hidden2/kernel/Regularizer/Const�
hidden2/kernel/Regularizer/SumSum%hidden2/kernel/Regularizer/Square:y:0)hidden2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2 
hidden2/kernel/Regularizer/Sum�
 hidden2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��'72"
 hidden2/kernel/Regularizer/mul/x�
hidden2/kernel/Regularizer/mulMul)hidden2/kernel/Regularizer/mul/x:output:0'hidden2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2 
hidden2/kernel/Regularizer/mul�
0hidden3/kernel/Regularizer/Square/ReadVariableOpReadVariableOphidden3_8174156* 
_output_shapes
:
��*
dtype022
0hidden3/kernel/Regularizer/Square/ReadVariableOp�
!hidden3/kernel/Regularizer/SquareSquare8hidden3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
��2#
!hidden3/kernel/Regularizer/Square�
 hidden3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2"
 hidden3/kernel/Regularizer/Const�
hidden3/kernel/Regularizer/SumSum%hidden3/kernel/Regularizer/Square:y:0)hidden3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2 
hidden3/kernel/Regularizer/Sum�
 hidden3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��'72"
 hidden3/kernel/Regularizer/mul/x�
hidden3/kernel/Regularizer/mulMul)hidden3/kernel/Regularizer/mul/x:output:0'hidden3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2 
hidden3/kernel/Regularizer/mul�
IdentityIdentity'output/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������2

Identity�
NoOpNoOp ^dropout/StatefulPartitionedCall"^dropout_1/StatefulPartitionedCall"^dropout_2/StatefulPartitionedCall ^hidden1/StatefulPartitionedCall1^hidden1/kernel/Regularizer/Square/ReadVariableOp ^hidden2/StatefulPartitionedCall1^hidden2/kernel/Regularizer/Square/ReadVariableOp ^hidden3/StatefulPartitionedCall1^hidden3/kernel/Regularizer/Square/ReadVariableOp^output/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������: : : : : : : : 2B
dropout/StatefulPartitionedCalldropout/StatefulPartitionedCall2F
!dropout_1/StatefulPartitionedCall!dropout_1/StatefulPartitionedCall2F
!dropout_2/StatefulPartitionedCall!dropout_2/StatefulPartitionedCall2B
hidden1/StatefulPartitionedCallhidden1/StatefulPartitionedCall2d
0hidden1/kernel/Regularizer/Square/ReadVariableOp0hidden1/kernel/Regularizer/Square/ReadVariableOp2B
hidden2/StatefulPartitionedCallhidden2/StatefulPartitionedCall2d
0hidden2/kernel/Regularizer/Square/ReadVariableOp0hidden2/kernel/Regularizer/Square/ReadVariableOp2B
hidden3/StatefulPartitionedCallhidden3/StatefulPartitionedCall2d
0hidden3/kernel/Regularizer/Square/ReadVariableOp0hidden3/kernel/Regularizer/Square/ReadVariableOp2@
output/StatefulPartitionedCalloutput/StatefulPartitionedCall:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
c
D__inference_dropout_layer_call_and_return_conditional_losses_8174581

inputs
identity�c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @2
dropout/Constt
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:����������2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape�
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:����������*
dtype0*
seed��2&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?2
dropout/GreaterEqual/y�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:����������2
dropout/GreaterEqual�
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:����������2
dropout/Cast{
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:����������2
dropout/Mul_1f
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:����������2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�4
�
"__inference__wrapped_model_8173857
hidden1_inputD
1sequential_hidden1_matmul_readvariableop_resource:	�A
2sequential_hidden1_biasadd_readvariableop_resource:	�E
1sequential_hidden2_matmul_readvariableop_resource:
��A
2sequential_hidden2_biasadd_readvariableop_resource:	�E
1sequential_hidden3_matmul_readvariableop_resource:
��A
2sequential_hidden3_biasadd_readvariableop_resource:	�C
0sequential_output_matmul_readvariableop_resource:	�?
1sequential_output_biasadd_readvariableop_resource:
identity��)sequential/hidden1/BiasAdd/ReadVariableOp�(sequential/hidden1/MatMul/ReadVariableOp�)sequential/hidden2/BiasAdd/ReadVariableOp�(sequential/hidden2/MatMul/ReadVariableOp�)sequential/hidden3/BiasAdd/ReadVariableOp�(sequential/hidden3/MatMul/ReadVariableOp�(sequential/output/BiasAdd/ReadVariableOp�'sequential/output/MatMul/ReadVariableOp�
(sequential/hidden1/MatMul/ReadVariableOpReadVariableOp1sequential_hidden1_matmul_readvariableop_resource*
_output_shapes
:	�*
dtype02*
(sequential/hidden1/MatMul/ReadVariableOp�
sequential/hidden1/MatMulMatMulhidden1_input0sequential/hidden1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������2
sequential/hidden1/MatMul�
)sequential/hidden1/BiasAdd/ReadVariableOpReadVariableOp2sequential_hidden1_biasadd_readvariableop_resource*
_output_shapes	
:�*
dtype02+
)sequential/hidden1/BiasAdd/ReadVariableOp�
sequential/hidden1/BiasAddBiasAdd#sequential/hidden1/MatMul:product:01sequential/hidden1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������2
sequential/hidden1/BiasAdd�
sequential/hidden1/ReluRelu#sequential/hidden1/BiasAdd:output:0*
T0*(
_output_shapes
:����������2
sequential/hidden1/Relu�
sequential/dropout/IdentityIdentity%sequential/hidden1/Relu:activations:0*
T0*(
_output_shapes
:����������2
sequential/dropout/Identity�
(sequential/hidden2/MatMul/ReadVariableOpReadVariableOp1sequential_hidden2_matmul_readvariableop_resource* 
_output_shapes
:
��*
dtype02*
(sequential/hidden2/MatMul/ReadVariableOp�
sequential/hidden2/MatMulMatMul$sequential/dropout/Identity:output:00sequential/hidden2/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������2
sequential/hidden2/MatMul�
)sequential/hidden2/BiasAdd/ReadVariableOpReadVariableOp2sequential_hidden2_biasadd_readvariableop_resource*
_output_shapes	
:�*
dtype02+
)sequential/hidden2/BiasAdd/ReadVariableOp�
sequential/hidden2/BiasAddBiasAdd#sequential/hidden2/MatMul:product:01sequential/hidden2/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������2
sequential/hidden2/BiasAdd�
sequential/hidden2/ReluRelu#sequential/hidden2/BiasAdd:output:0*
T0*(
_output_shapes
:����������2
sequential/hidden2/Relu�
sequential/dropout_1/IdentityIdentity%sequential/hidden2/Relu:activations:0*
T0*(
_output_shapes
:����������2
sequential/dropout_1/Identity�
(sequential/hidden3/MatMul/ReadVariableOpReadVariableOp1sequential_hidden3_matmul_readvariableop_resource* 
_output_shapes
:
��*
dtype02*
(sequential/hidden3/MatMul/ReadVariableOp�
sequential/hidden3/MatMulMatMul&sequential/dropout_1/Identity:output:00sequential/hidden3/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������2
sequential/hidden3/MatMul�
)sequential/hidden3/BiasAdd/ReadVariableOpReadVariableOp2sequential_hidden3_biasadd_readvariableop_resource*
_output_shapes	
:�*
dtype02+
)sequential/hidden3/BiasAdd/ReadVariableOp�
sequential/hidden3/BiasAddBiasAdd#sequential/hidden3/MatMul:product:01sequential/hidden3/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������2
sequential/hidden3/BiasAdd�
sequential/hidden3/ReluRelu#sequential/hidden3/BiasAdd:output:0*
T0*(
_output_shapes
:����������2
sequential/hidden3/Relu�
sequential/dropout_2/IdentityIdentity%sequential/hidden3/Relu:activations:0*
T0*(
_output_shapes
:����������2
sequential/dropout_2/Identity�
'sequential/output/MatMul/ReadVariableOpReadVariableOp0sequential_output_matmul_readvariableop_resource*
_output_shapes
:	�*
dtype02)
'sequential/output/MatMul/ReadVariableOp�
sequential/output/MatMulMatMul&sequential/dropout_2/Identity:output:0/sequential/output/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
sequential/output/MatMul�
(sequential/output/BiasAdd/ReadVariableOpReadVariableOp1sequential_output_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02*
(sequential/output/BiasAdd/ReadVariableOp�
sequential/output/BiasAddBiasAdd"sequential/output/MatMul:product:00sequential/output/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
sequential/output/BiasAdd�
sequential/output/SigmoidSigmoid"sequential/output/BiasAdd:output:0*
T0*'
_output_shapes
:���������2
sequential/output/Sigmoidx
IdentityIdentitysequential/output/Sigmoid:y:0^NoOp*
T0*'
_output_shapes
:���������2

Identity�
NoOpNoOp*^sequential/hidden1/BiasAdd/ReadVariableOp)^sequential/hidden1/MatMul/ReadVariableOp*^sequential/hidden2/BiasAdd/ReadVariableOp)^sequential/hidden2/MatMul/ReadVariableOp*^sequential/hidden3/BiasAdd/ReadVariableOp)^sequential/hidden3/MatMul/ReadVariableOp)^sequential/output/BiasAdd/ReadVariableOp(^sequential/output/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������: : : : : : : : 2V
)sequential/hidden1/BiasAdd/ReadVariableOp)sequential/hidden1/BiasAdd/ReadVariableOp2T
(sequential/hidden1/MatMul/ReadVariableOp(sequential/hidden1/MatMul/ReadVariableOp2V
)sequential/hidden2/BiasAdd/ReadVariableOp)sequential/hidden2/BiasAdd/ReadVariableOp2T
(sequential/hidden2/MatMul/ReadVariableOp(sequential/hidden2/MatMul/ReadVariableOp2V
)sequential/hidden3/BiasAdd/ReadVariableOp)sequential/hidden3/BiasAdd/ReadVariableOp2T
(sequential/hidden3/MatMul/ReadVariableOp(sequential/hidden3/MatMul/ReadVariableOp2T
(sequential/output/BiasAdd/ReadVariableOp(sequential/output/BiasAdd/ReadVariableOp2R
'sequential/output/MatMul/ReadVariableOp'sequential/output/MatMul/ReadVariableOp:V R
'
_output_shapes
:���������
'
_user_specified_namehidden1_input
�
d
+__inference_dropout_1_layer_call_fn_8174650

inputs
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *O
fJRH
F__inference_dropout_1_layer_call_and_return_conditional_losses_81740722
StatefulPartitionedCall|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:����������2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�H
�
G__inference_sequential_layer_call_and_return_conditional_losses_8174416

inputs9
&hidden1_matmul_readvariableop_resource:	�6
'hidden1_biasadd_readvariableop_resource:	�:
&hidden2_matmul_readvariableop_resource:
��6
'hidden2_biasadd_readvariableop_resource:	�:
&hidden3_matmul_readvariableop_resource:
��6
'hidden3_biasadd_readvariableop_resource:	�8
%output_matmul_readvariableop_resource:	�4
&output_biasadd_readvariableop_resource:
identity��hidden1/BiasAdd/ReadVariableOp�hidden1/MatMul/ReadVariableOp�0hidden1/kernel/Regularizer/Square/ReadVariableOp�hidden2/BiasAdd/ReadVariableOp�hidden2/MatMul/ReadVariableOp�0hidden2/kernel/Regularizer/Square/ReadVariableOp�hidden3/BiasAdd/ReadVariableOp�hidden3/MatMul/ReadVariableOp�0hidden3/kernel/Regularizer/Square/ReadVariableOp�output/BiasAdd/ReadVariableOp�output/MatMul/ReadVariableOp�
hidden1/MatMul/ReadVariableOpReadVariableOp&hidden1_matmul_readvariableop_resource*
_output_shapes
:	�*
dtype02
hidden1/MatMul/ReadVariableOp�
hidden1/MatMulMatMulinputs%hidden1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������2
hidden1/MatMul�
hidden1/BiasAdd/ReadVariableOpReadVariableOp'hidden1_biasadd_readvariableop_resource*
_output_shapes	
:�*
dtype02 
hidden1/BiasAdd/ReadVariableOp�
hidden1/BiasAddBiasAddhidden1/MatMul:product:0&hidden1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������2
hidden1/BiasAddq
hidden1/ReluReluhidden1/BiasAdd:output:0*
T0*(
_output_shapes
:����������2
hidden1/Relu
dropout/IdentityIdentityhidden1/Relu:activations:0*
T0*(
_output_shapes
:����������2
dropout/Identity�
hidden2/MatMul/ReadVariableOpReadVariableOp&hidden2_matmul_readvariableop_resource* 
_output_shapes
:
��*
dtype02
hidden2/MatMul/ReadVariableOp�
hidden2/MatMulMatMuldropout/Identity:output:0%hidden2/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������2
hidden2/MatMul�
hidden2/BiasAdd/ReadVariableOpReadVariableOp'hidden2_biasadd_readvariableop_resource*
_output_shapes	
:�*
dtype02 
hidden2/BiasAdd/ReadVariableOp�
hidden2/BiasAddBiasAddhidden2/MatMul:product:0&hidden2/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������2
hidden2/BiasAddq
hidden2/ReluReluhidden2/BiasAdd:output:0*
T0*(
_output_shapes
:����������2
hidden2/Relu�
dropout_1/IdentityIdentityhidden2/Relu:activations:0*
T0*(
_output_shapes
:����������2
dropout_1/Identity�
hidden3/MatMul/ReadVariableOpReadVariableOp&hidden3_matmul_readvariableop_resource* 
_output_shapes
:
��*
dtype02
hidden3/MatMul/ReadVariableOp�
hidden3/MatMulMatMuldropout_1/Identity:output:0%hidden3/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������2
hidden3/MatMul�
hidden3/BiasAdd/ReadVariableOpReadVariableOp'hidden3_biasadd_readvariableop_resource*
_output_shapes	
:�*
dtype02 
hidden3/BiasAdd/ReadVariableOp�
hidden3/BiasAddBiasAddhidden3/MatMul:product:0&hidden3/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������2
hidden3/BiasAddq
hidden3/ReluReluhidden3/BiasAdd:output:0*
T0*(
_output_shapes
:����������2
hidden3/Relu�
dropout_2/IdentityIdentityhidden3/Relu:activations:0*
T0*(
_output_shapes
:����������2
dropout_2/Identity�
output/MatMul/ReadVariableOpReadVariableOp%output_matmul_readvariableop_resource*
_output_shapes
:	�*
dtype02
output/MatMul/ReadVariableOp�
output/MatMulMatMuldropout_2/Identity:output:0$output/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
output/MatMul�
output/BiasAdd/ReadVariableOpReadVariableOp&output_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02
output/BiasAdd/ReadVariableOp�
output/BiasAddBiasAddoutput/MatMul:product:0%output/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
output/BiasAddv
output/SigmoidSigmoidoutput/BiasAdd:output:0*
T0*'
_output_shapes
:���������2
output/Sigmoid�
0hidden1/kernel/Regularizer/Square/ReadVariableOpReadVariableOp&hidden1_matmul_readvariableop_resource*
_output_shapes
:	�*
dtype022
0hidden1/kernel/Regularizer/Square/ReadVariableOp�
!hidden1/kernel/Regularizer/SquareSquare8hidden1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	�2#
!hidden1/kernel/Regularizer/Square�
 hidden1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2"
 hidden1/kernel/Regularizer/Const�
hidden1/kernel/Regularizer/SumSum%hidden1/kernel/Regularizer/Square:y:0)hidden1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2 
hidden1/kernel/Regularizer/Sum�
 hidden1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��'72"
 hidden1/kernel/Regularizer/mul/x�
hidden1/kernel/Regularizer/mulMul)hidden1/kernel/Regularizer/mul/x:output:0'hidden1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2 
hidden1/kernel/Regularizer/mul�
0hidden2/kernel/Regularizer/Square/ReadVariableOpReadVariableOp&hidden2_matmul_readvariableop_resource* 
_output_shapes
:
��*
dtype022
0hidden2/kernel/Regularizer/Square/ReadVariableOp�
!hidden2/kernel/Regularizer/SquareSquare8hidden2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
��2#
!hidden2/kernel/Regularizer/Square�
 hidden2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2"
 hidden2/kernel/Regularizer/Const�
hidden2/kernel/Regularizer/SumSum%hidden2/kernel/Regularizer/Square:y:0)hidden2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2 
hidden2/kernel/Regularizer/Sum�
 hidden2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��'72"
 hidden2/kernel/Regularizer/mul/x�
hidden2/kernel/Regularizer/mulMul)hidden2/kernel/Regularizer/mul/x:output:0'hidden2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2 
hidden2/kernel/Regularizer/mul�
0hidden3/kernel/Regularizer/Square/ReadVariableOpReadVariableOp&hidden3_matmul_readvariableop_resource* 
_output_shapes
:
��*
dtype022
0hidden3/kernel/Regularizer/Square/ReadVariableOp�
!hidden3/kernel/Regularizer/SquareSquare8hidden3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
��2#
!hidden3/kernel/Regularizer/Square�
 hidden3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2"
 hidden3/kernel/Regularizer/Const�
hidden3/kernel/Regularizer/SumSum%hidden3/kernel/Regularizer/Square:y:0)hidden3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2 
hidden3/kernel/Regularizer/Sum�
 hidden3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��'72"
 hidden3/kernel/Regularizer/mul/x�
hidden3/kernel/Regularizer/mulMul)hidden3/kernel/Regularizer/mul/x:output:0'hidden3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2 
hidden3/kernel/Regularizer/mulm
IdentityIdentityoutput/Sigmoid:y:0^NoOp*
T0*'
_output_shapes
:���������2

Identity�
NoOpNoOp^hidden1/BiasAdd/ReadVariableOp^hidden1/MatMul/ReadVariableOp1^hidden1/kernel/Regularizer/Square/ReadVariableOp^hidden2/BiasAdd/ReadVariableOp^hidden2/MatMul/ReadVariableOp1^hidden2/kernel/Regularizer/Square/ReadVariableOp^hidden3/BiasAdd/ReadVariableOp^hidden3/MatMul/ReadVariableOp1^hidden3/kernel/Regularizer/Square/ReadVariableOp^output/BiasAdd/ReadVariableOp^output/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������: : : : : : : : 2@
hidden1/BiasAdd/ReadVariableOphidden1/BiasAdd/ReadVariableOp2>
hidden1/MatMul/ReadVariableOphidden1/MatMul/ReadVariableOp2d
0hidden1/kernel/Regularizer/Square/ReadVariableOp0hidden1/kernel/Regularizer/Square/ReadVariableOp2@
hidden2/BiasAdd/ReadVariableOphidden2/BiasAdd/ReadVariableOp2>
hidden2/MatMul/ReadVariableOphidden2/MatMul/ReadVariableOp2d
0hidden2/kernel/Regularizer/Square/ReadVariableOp0hidden2/kernel/Regularizer/Square/ReadVariableOp2@
hidden3/BiasAdd/ReadVariableOphidden3/BiasAdd/ReadVariableOp2>
hidden3/MatMul/ReadVariableOphidden3/MatMul/ReadVariableOp2d
0hidden3/kernel/Regularizer/Square/ReadVariableOp0hidden3/kernel/Regularizer/Square/ReadVariableOp2>
output/BiasAdd/ReadVariableOpoutput/BiasAdd/ReadVariableOp2<
output/MatMul/ReadVariableOpoutput/MatMul/ReadVariableOp:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
C__inference_output_layer_call_and_return_conditional_losses_8173965

inputs1
matmul_readvariableop_resource:	�-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
MatMul�
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp�
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2	
BiasAdda
SigmoidSigmoidBiasAdd:output:0*
T0*'
_output_shapes
:���������2	
Sigmoidf
IdentityIdentitySigmoid:y:0^NoOp*
T0*'
_output_shapes
:���������2

Identity
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
D__inference_hidden3_layer_call_and_return_conditional_losses_8174673

inputs2
matmul_readvariableop_resource:
��.
biasadd_readvariableop_resource:	�
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�0hidden3/kernel/Regularizer/Square/ReadVariableOp�
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
��*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������2
MatMul�
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:�*
dtype02
BiasAdd/ReadVariableOp�
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������2	
BiasAddY
ReluReluBiasAdd:output:0*
T0*(
_output_shapes
:����������2
Relu�
0hidden3/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
��*
dtype022
0hidden3/kernel/Regularizer/Square/ReadVariableOp�
!hidden3/kernel/Regularizer/SquareSquare8hidden3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
��2#
!hidden3/kernel/Regularizer/Square�
 hidden3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2"
 hidden3/kernel/Regularizer/Const�
hidden3/kernel/Regularizer/SumSum%hidden3/kernel/Regularizer/Square:y:0)hidden3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2 
hidden3/kernel/Regularizer/Sum�
 hidden3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��'72"
 hidden3/kernel/Regularizer/mul/x�
hidden3/kernel/Regularizer/mulMul)hidden3/kernel/Regularizer/mul/x:output:0'hidden3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2 
hidden3/kernel/Regularizer/muln
IdentityIdentityRelu:activations:0^NoOp*
T0*(
_output_shapes
:����������2

Identity�
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp1^hidden3/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2d
0hidden3/kernel/Regularizer/Square/ReadVariableOp0hidden3/kernel/Regularizer/Square/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
(__inference_output_layer_call_fn_8174729

inputs
unknown:	�
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_output_layer_call_and_return_conditional_losses_81739652
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�	
�
,__inference_sequential_layer_call_fn_8174511

inputs
unknown:	�
	unknown_0:	�
	unknown_1:
��
	unknown_2:	�
	unknown_3:
��
	unknown_4:	�
	unknown_5:	�
	unknown_6:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������**
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8� *P
fKRI
G__inference_sequential_layer_call_and_return_conditional_losses_81739902
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�X
�
 __inference__traced_save_8174914
file_prefix-
)savev2_hidden1_kernel_read_readvariableop+
'savev2_hidden1_bias_read_readvariableop-
)savev2_hidden2_kernel_read_readvariableop+
'savev2_hidden2_bias_read_readvariableop-
)savev2_hidden3_kernel_read_readvariableop+
'savev2_hidden3_bias_read_readvariableop,
(savev2_output_kernel_read_readvariableop*
&savev2_output_bias_read_readvariableop(
$savev2_adam_iter_read_readvariableop	*
&savev2_adam_beta_1_read_readvariableop*
&savev2_adam_beta_2_read_readvariableop)
%savev2_adam_decay_read_readvariableop1
-savev2_adam_learning_rate_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableop-
)savev2_true_positives_read_readvariableop-
)savev2_true_negatives_read_readvariableop.
*savev2_false_positives_read_readvariableop.
*savev2_false_negatives_read_readvariableop/
+savev2_true_positives_1_read_readvariableop0
,savev2_false_negatives_1_read_readvariableop/
+savev2_true_positives_2_read_readvariableop0
,savev2_false_positives_1_read_readvariableop/
+savev2_true_positives_3_read_readvariableop/
+savev2_true_negatives_1_read_readvariableop0
,savev2_false_positives_2_read_readvariableop0
,savev2_false_negatives_2_read_readvariableop4
0savev2_adam_hidden1_kernel_m_read_readvariableop2
.savev2_adam_hidden1_bias_m_read_readvariableop4
0savev2_adam_hidden2_kernel_m_read_readvariableop2
.savev2_adam_hidden2_bias_m_read_readvariableop4
0savev2_adam_hidden3_kernel_m_read_readvariableop2
.savev2_adam_hidden3_bias_m_read_readvariableop3
/savev2_adam_output_kernel_m_read_readvariableop1
-savev2_adam_output_bias_m_read_readvariableop4
0savev2_adam_hidden1_kernel_v_read_readvariableop2
.savev2_adam_hidden1_bias_v_read_readvariableop4
0savev2_adam_hidden2_kernel_v_read_readvariableop2
.savev2_adam_hidden2_bias_v_read_readvariableop4
0savev2_adam_hidden3_kernel_v_read_readvariableop2
.savev2_adam_hidden3_bias_v_read_readvariableop3
/savev2_adam_output_kernel_v_read_readvariableop1
-savev2_adam_output_bias_v_read_readvariableop
savev2_const

identity_1��MergeV2Checkpoints�
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*2
StaticRegexFullMatchc
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.part2
Constl
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part2	
Const_1�
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: 2
Selectt

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: 2

StringJoinZ

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :2

num_shards
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 2
ShardedFilename/shard�
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: 2
ShardedFilename�
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:,*
dtype0*�
value�B�,B6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB=keras_api/metrics/1/true_positives/.ATTRIBUTES/VARIABLE_VALUEB=keras_api/metrics/1/true_negatives/.ATTRIBUTES/VARIABLE_VALUEB>keras_api/metrics/1/false_positives/.ATTRIBUTES/VARIABLE_VALUEB>keras_api/metrics/1/false_negatives/.ATTRIBUTES/VARIABLE_VALUEB=keras_api/metrics/2/true_positives/.ATTRIBUTES/VARIABLE_VALUEB>keras_api/metrics/2/false_negatives/.ATTRIBUTES/VARIABLE_VALUEB=keras_api/metrics/3/true_positives/.ATTRIBUTES/VARIABLE_VALUEB>keras_api/metrics/3/false_positives/.ATTRIBUTES/VARIABLE_VALUEB=keras_api/metrics/4/true_positives/.ATTRIBUTES/VARIABLE_VALUEB=keras_api/metrics/4/true_negatives/.ATTRIBUTES/VARIABLE_VALUEB>keras_api/metrics/4/false_positives/.ATTRIBUTES/VARIABLE_VALUEB>keras_api/metrics/4/false_negatives/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
SaveV2/tensor_names�
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:,*
dtype0*k
valuebB`,B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B 2
SaveV2/shape_and_slices�
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0)savev2_hidden1_kernel_read_readvariableop'savev2_hidden1_bias_read_readvariableop)savev2_hidden2_kernel_read_readvariableop'savev2_hidden2_bias_read_readvariableop)savev2_hidden3_kernel_read_readvariableop'savev2_hidden3_bias_read_readvariableop(savev2_output_kernel_read_readvariableop&savev2_output_bias_read_readvariableop$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop)savev2_true_positives_read_readvariableop)savev2_true_negatives_read_readvariableop*savev2_false_positives_read_readvariableop*savev2_false_negatives_read_readvariableop+savev2_true_positives_1_read_readvariableop,savev2_false_negatives_1_read_readvariableop+savev2_true_positives_2_read_readvariableop,savev2_false_positives_1_read_readvariableop+savev2_true_positives_3_read_readvariableop+savev2_true_negatives_1_read_readvariableop,savev2_false_positives_2_read_readvariableop,savev2_false_negatives_2_read_readvariableop0savev2_adam_hidden1_kernel_m_read_readvariableop.savev2_adam_hidden1_bias_m_read_readvariableop0savev2_adam_hidden2_kernel_m_read_readvariableop.savev2_adam_hidden2_bias_m_read_readvariableop0savev2_adam_hidden3_kernel_m_read_readvariableop.savev2_adam_hidden3_bias_m_read_readvariableop/savev2_adam_output_kernel_m_read_readvariableop-savev2_adam_output_bias_m_read_readvariableop0savev2_adam_hidden1_kernel_v_read_readvariableop.savev2_adam_hidden1_bias_v_read_readvariableop0savev2_adam_hidden2_kernel_v_read_readvariableop.savev2_adam_hidden2_bias_v_read_readvariableop0savev2_adam_hidden3_kernel_v_read_readvariableop.savev2_adam_hidden3_bias_v_read_readvariableop/savev2_adam_output_kernel_v_read_readvariableop-savev2_adam_output_bias_v_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *:
dtypes0
.2,	2
SaveV2�
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:2(
&MergeV2Checkpoints/checkpoint_prefixes�
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 2
MergeV2Checkpointsr
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: 2

Identity_

Identity_1IdentityIdentity:output:0^NoOp*
T0*
_output_shapes
: 2

Identity_1c
NoOpNoOp^MergeV2Checkpoints*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"!

identity_1Identity_1:output:0*�
_input_shapes�
�: :	�:�:
��:�:
��:�:	�:: : : : : : : :�:�:�:�:::::�:�:�:�:	�:�:
��:�:
��:�:	�::	�:�:
��:�:
��:�:	�:: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:%!

_output_shapes
:	�:!

_output_shapes	
:�:&"
 
_output_shapes
:
��:!

_output_shapes	
:�:&"
 
_output_shapes
:
��:!

_output_shapes	
:�:%!

_output_shapes
:	�: 

_output_shapes
::	

_output_shapes
: :


_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :!

_output_shapes	
:�:!

_output_shapes	
:�:!

_output_shapes	
:�:!

_output_shapes	
:�: 

_output_shapes
:: 

_output_shapes
:: 

_output_shapes
:: 

_output_shapes
::!

_output_shapes	
:�:!

_output_shapes	
:�:!

_output_shapes	
:�:!

_output_shapes	
:�:%!

_output_shapes
:	�:!

_output_shapes	
:�:&"
 
_output_shapes
:
��:!

_output_shapes	
:�:& "
 
_output_shapes
:
��:!!

_output_shapes	
:�:%"!

_output_shapes
:	�: #

_output_shapes
::%$!

_output_shapes
:	�:!%

_output_shapes	
:�:&&"
 
_output_shapes
:
��:!'

_output_shapes	
:�:&("
 
_output_shapes
:
��:!)

_output_shapes	
:�:%*!

_output_shapes
:	�: +

_output_shapes
::,

_output_shapes
: 
�
�
)__inference_hidden2_layer_call_fn_8174623

inputs
unknown:
��
	unknown_0:	�
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_hidden2_layer_call_and_return_conditional_losses_81739112
StatefulPartitionedCall|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:����������2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
__inference_loss_fn_2_8174762M
9hidden3_kernel_regularizer_square_readvariableop_resource:
��
identity��0hidden3/kernel/Regularizer/Square/ReadVariableOp�
0hidden3/kernel/Regularizer/Square/ReadVariableOpReadVariableOp9hidden3_kernel_regularizer_square_readvariableop_resource* 
_output_shapes
:
��*
dtype022
0hidden3/kernel/Regularizer/Square/ReadVariableOp�
!hidden3/kernel/Regularizer/SquareSquare8hidden3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
��2#
!hidden3/kernel/Regularizer/Square�
 hidden3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2"
 hidden3/kernel/Regularizer/Const�
hidden3/kernel/Regularizer/SumSum%hidden3/kernel/Regularizer/Square:y:0)hidden3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2 
hidden3/kernel/Regularizer/Sum�
 hidden3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��'72"
 hidden3/kernel/Regularizer/mul/x�
hidden3/kernel/Regularizer/mulMul)hidden3/kernel/Regularizer/mul/x:output:0'hidden3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2 
hidden3/kernel/Regularizer/mull
IdentityIdentity"hidden3/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: 2

Identity�
NoOpNoOp1^hidden3/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2d
0hidden3/kernel/Regularizer/Square/ReadVariableOp0hidden3/kernel/Regularizer/Square/ReadVariableOp
�=
�
G__inference_sequential_layer_call_and_return_conditional_losses_8173990

inputs"
hidden1_8173882:	�
hidden1_8173884:	�#
hidden2_8173912:
��
hidden2_8173914:	�#
hidden3_8173942:
��
hidden3_8173944:	�!
output_8173966:	�
output_8173968:
identity��hidden1/StatefulPartitionedCall�0hidden1/kernel/Regularizer/Square/ReadVariableOp�hidden2/StatefulPartitionedCall�0hidden2/kernel/Regularizer/Square/ReadVariableOp�hidden3/StatefulPartitionedCall�0hidden3/kernel/Regularizer/Square/ReadVariableOp�output/StatefulPartitionedCall�
hidden1/StatefulPartitionedCallStatefulPartitionedCallinputshidden1_8173882hidden1_8173884*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_hidden1_layer_call_and_return_conditional_losses_81738812!
hidden1/StatefulPartitionedCall�
dropout/PartitionedCallPartitionedCall(hidden1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_dropout_layer_call_and_return_conditional_losses_81738922
dropout/PartitionedCall�
hidden2/StatefulPartitionedCallStatefulPartitionedCall dropout/PartitionedCall:output:0hidden2_8173912hidden2_8173914*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_hidden2_layer_call_and_return_conditional_losses_81739112!
hidden2/StatefulPartitionedCall�
dropout_1/PartitionedCallPartitionedCall(hidden2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *O
fJRH
F__inference_dropout_1_layer_call_and_return_conditional_losses_81739222
dropout_1/PartitionedCall�
hidden3/StatefulPartitionedCallStatefulPartitionedCall"dropout_1/PartitionedCall:output:0hidden3_8173942hidden3_8173944*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_hidden3_layer_call_and_return_conditional_losses_81739412!
hidden3/StatefulPartitionedCall�
dropout_2/PartitionedCallPartitionedCall(hidden3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *O
fJRH
F__inference_dropout_2_layer_call_and_return_conditional_losses_81739522
dropout_2/PartitionedCall�
output/StatefulPartitionedCallStatefulPartitionedCall"dropout_2/PartitionedCall:output:0output_8173966output_8173968*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_output_layer_call_and_return_conditional_losses_81739652 
output/StatefulPartitionedCall�
0hidden1/kernel/Regularizer/Square/ReadVariableOpReadVariableOphidden1_8173882*
_output_shapes
:	�*
dtype022
0hidden1/kernel/Regularizer/Square/ReadVariableOp�
!hidden1/kernel/Regularizer/SquareSquare8hidden1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	�2#
!hidden1/kernel/Regularizer/Square�
 hidden1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2"
 hidden1/kernel/Regularizer/Const�
hidden1/kernel/Regularizer/SumSum%hidden1/kernel/Regularizer/Square:y:0)hidden1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2 
hidden1/kernel/Regularizer/Sum�
 hidden1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��'72"
 hidden1/kernel/Regularizer/mul/x�
hidden1/kernel/Regularizer/mulMul)hidden1/kernel/Regularizer/mul/x:output:0'hidden1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2 
hidden1/kernel/Regularizer/mul�
0hidden2/kernel/Regularizer/Square/ReadVariableOpReadVariableOphidden2_8173912* 
_output_shapes
:
��*
dtype022
0hidden2/kernel/Regularizer/Square/ReadVariableOp�
!hidden2/kernel/Regularizer/SquareSquare8hidden2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
��2#
!hidden2/kernel/Regularizer/Square�
 hidden2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2"
 hidden2/kernel/Regularizer/Const�
hidden2/kernel/Regularizer/SumSum%hidden2/kernel/Regularizer/Square:y:0)hidden2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2 
hidden2/kernel/Regularizer/Sum�
 hidden2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��'72"
 hidden2/kernel/Regularizer/mul/x�
hidden2/kernel/Regularizer/mulMul)hidden2/kernel/Regularizer/mul/x:output:0'hidden2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2 
hidden2/kernel/Regularizer/mul�
0hidden3/kernel/Regularizer/Square/ReadVariableOpReadVariableOphidden3_8173942* 
_output_shapes
:
��*
dtype022
0hidden3/kernel/Regularizer/Square/ReadVariableOp�
!hidden3/kernel/Regularizer/SquareSquare8hidden3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
��2#
!hidden3/kernel/Regularizer/Square�
 hidden3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2"
 hidden3/kernel/Regularizer/Const�
hidden3/kernel/Regularizer/SumSum%hidden3/kernel/Regularizer/Square:y:0)hidden3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2 
hidden3/kernel/Regularizer/Sum�
 hidden3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��'72"
 hidden3/kernel/Regularizer/mul/x�
hidden3/kernel/Regularizer/mulMul)hidden3/kernel/Regularizer/mul/x:output:0'hidden3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2 
hidden3/kernel/Regularizer/mul�
IdentityIdentity'output/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������2

Identity�
NoOpNoOp ^hidden1/StatefulPartitionedCall1^hidden1/kernel/Regularizer/Square/ReadVariableOp ^hidden2/StatefulPartitionedCall1^hidden2/kernel/Regularizer/Square/ReadVariableOp ^hidden3/StatefulPartitionedCall1^hidden3/kernel/Regularizer/Square/ReadVariableOp^output/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������: : : : : : : : 2B
hidden1/StatefulPartitionedCallhidden1/StatefulPartitionedCall2d
0hidden1/kernel/Regularizer/Square/ReadVariableOp0hidden1/kernel/Regularizer/Square/ReadVariableOp2B
hidden2/StatefulPartitionedCallhidden2/StatefulPartitionedCall2d
0hidden2/kernel/Regularizer/Square/ReadVariableOp0hidden2/kernel/Regularizer/Square/ReadVariableOp2B
hidden3/StatefulPartitionedCallhidden3/StatefulPartitionedCall2d
0hidden3/kernel/Regularizer/Square/ReadVariableOp0hidden3/kernel/Regularizer/Square/ReadVariableOp2@
output/StatefulPartitionedCalloutput/StatefulPartitionedCall:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
)__inference_hidden1_layer_call_fn_8174564

inputs
unknown:	�
	unknown_0:	�
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_hidden1_layer_call_and_return_conditional_losses_81738812
StatefulPartitionedCall|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:����������2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
D__inference_hidden1_layer_call_and_return_conditional_losses_8173881

inputs1
matmul_readvariableop_resource:	�.
biasadd_readvariableop_resource:	�
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�0hidden1/kernel/Regularizer/Square/ReadVariableOp�
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������2
MatMul�
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:�*
dtype02
BiasAdd/ReadVariableOp�
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������2	
BiasAddY
ReluReluBiasAdd:output:0*
T0*(
_output_shapes
:����������2
Relu�
0hidden1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�*
dtype022
0hidden1/kernel/Regularizer/Square/ReadVariableOp�
!hidden1/kernel/Regularizer/SquareSquare8hidden1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	�2#
!hidden1/kernel/Regularizer/Square�
 hidden1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2"
 hidden1/kernel/Regularizer/Const�
hidden1/kernel/Regularizer/SumSum%hidden1/kernel/Regularizer/Square:y:0)hidden1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2 
hidden1/kernel/Regularizer/Sum�
 hidden1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��'72"
 hidden1/kernel/Regularizer/mul/x�
hidden1/kernel/Regularizer/mulMul)hidden1/kernel/Regularizer/mul/x:output:0'hidden1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2 
hidden1/kernel/Regularizer/muln
IdentityIdentityRelu:activations:0^NoOp*
T0*(
_output_shapes
:����������2

Identity�
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp1^hidden1/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2d
0hidden1/kernel/Regularizer/Square/ReadVariableOp0hidden1/kernel/Regularizer/Square/ReadVariableOp:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
D__inference_hidden2_layer_call_and_return_conditional_losses_8174614

inputs2
matmul_readvariableop_resource:
��.
biasadd_readvariableop_resource:	�
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�0hidden2/kernel/Regularizer/Square/ReadVariableOp�
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
��*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������2
MatMul�
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:�*
dtype02
BiasAdd/ReadVariableOp�
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������2	
BiasAddY
ReluReluBiasAdd:output:0*
T0*(
_output_shapes
:����������2
Relu�
0hidden2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
��*
dtype022
0hidden2/kernel/Regularizer/Square/ReadVariableOp�
!hidden2/kernel/Regularizer/SquareSquare8hidden2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
��2#
!hidden2/kernel/Regularizer/Square�
 hidden2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2"
 hidden2/kernel/Regularizer/Const�
hidden2/kernel/Regularizer/SumSum%hidden2/kernel/Regularizer/Square:y:0)hidden2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2 
hidden2/kernel/Regularizer/Sum�
 hidden2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��'72"
 hidden2/kernel/Regularizer/mul/x�
hidden2/kernel/Regularizer/mulMul)hidden2/kernel/Regularizer/mul/x:output:0'hidden2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2 
hidden2/kernel/Regularizer/muln
IdentityIdentityRelu:activations:0^NoOp*
T0*(
_output_shapes
:����������2

Identity�
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp1^hidden2/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2d
0hidden2/kernel/Regularizer/Square/ReadVariableOp0hidden2/kernel/Regularizer/Square/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�	
�
,__inference_sequential_layer_call_fn_8174532

inputs
unknown:	�
	unknown_0:	�
	unknown_1:
��
	unknown_2:	�
	unknown_3:
��
	unknown_4:	�
	unknown_5:	�
	unknown_6:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������**
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8� *P
fKRI
G__inference_sequential_layer_call_and_return_conditional_losses_81741862
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
d
F__inference_dropout_1_layer_call_and_return_conditional_losses_8174628

inputs

identity_1[
IdentityIdentityinputs*
T0*(
_output_shapes
:����������2

Identityj

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:����������2

Identity_1"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
)__inference_hidden3_layer_call_fn_8174682

inputs
unknown:
��
	unknown_0:	�
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_hidden3_layer_call_and_return_conditional_losses_81739412
StatefulPartitionedCall|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:����������2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
d
F__inference_dropout_1_layer_call_and_return_conditional_losses_8173922

inputs

identity_1[
IdentityIdentityinputs*
T0*(
_output_shapes
:����������2

Identityj

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:����������2

Identity_1"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�B
�
G__inference_sequential_layer_call_and_return_conditional_losses_8174316
hidden1_input"
hidden1_8174274:	�
hidden1_8174276:	�#
hidden2_8174280:
��
hidden2_8174282:	�#
hidden3_8174286:
��
hidden3_8174288:	�!
output_8174292:	�
output_8174294:
identity��dropout/StatefulPartitionedCall�!dropout_1/StatefulPartitionedCall�!dropout_2/StatefulPartitionedCall�hidden1/StatefulPartitionedCall�0hidden1/kernel/Regularizer/Square/ReadVariableOp�hidden2/StatefulPartitionedCall�0hidden2/kernel/Regularizer/Square/ReadVariableOp�hidden3/StatefulPartitionedCall�0hidden3/kernel/Regularizer/Square/ReadVariableOp�output/StatefulPartitionedCall�
hidden1/StatefulPartitionedCallStatefulPartitionedCallhidden1_inputhidden1_8174274hidden1_8174276*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_hidden1_layer_call_and_return_conditional_losses_81738812!
hidden1/StatefulPartitionedCall�
dropout/StatefulPartitionedCallStatefulPartitionedCall(hidden1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_dropout_layer_call_and_return_conditional_losses_81741052!
dropout/StatefulPartitionedCall�
hidden2/StatefulPartitionedCallStatefulPartitionedCall(dropout/StatefulPartitionedCall:output:0hidden2_8174280hidden2_8174282*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_hidden2_layer_call_and_return_conditional_losses_81739112!
hidden2/StatefulPartitionedCall�
!dropout_1/StatefulPartitionedCallStatefulPartitionedCall(hidden2/StatefulPartitionedCall:output:0 ^dropout/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *O
fJRH
F__inference_dropout_1_layer_call_and_return_conditional_losses_81740722#
!dropout_1/StatefulPartitionedCall�
hidden3/StatefulPartitionedCallStatefulPartitionedCall*dropout_1/StatefulPartitionedCall:output:0hidden3_8174286hidden3_8174288*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_hidden3_layer_call_and_return_conditional_losses_81739412!
hidden3/StatefulPartitionedCall�
!dropout_2/StatefulPartitionedCallStatefulPartitionedCall(hidden3/StatefulPartitionedCall:output:0"^dropout_1/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *O
fJRH
F__inference_dropout_2_layer_call_and_return_conditional_losses_81740392#
!dropout_2/StatefulPartitionedCall�
output/StatefulPartitionedCallStatefulPartitionedCall*dropout_2/StatefulPartitionedCall:output:0output_8174292output_8174294*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_output_layer_call_and_return_conditional_losses_81739652 
output/StatefulPartitionedCall�
0hidden1/kernel/Regularizer/Square/ReadVariableOpReadVariableOphidden1_8174274*
_output_shapes
:	�*
dtype022
0hidden1/kernel/Regularizer/Square/ReadVariableOp�
!hidden1/kernel/Regularizer/SquareSquare8hidden1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	�2#
!hidden1/kernel/Regularizer/Square�
 hidden1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2"
 hidden1/kernel/Regularizer/Const�
hidden1/kernel/Regularizer/SumSum%hidden1/kernel/Regularizer/Square:y:0)hidden1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2 
hidden1/kernel/Regularizer/Sum�
 hidden1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��'72"
 hidden1/kernel/Regularizer/mul/x�
hidden1/kernel/Regularizer/mulMul)hidden1/kernel/Regularizer/mul/x:output:0'hidden1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2 
hidden1/kernel/Regularizer/mul�
0hidden2/kernel/Regularizer/Square/ReadVariableOpReadVariableOphidden2_8174280* 
_output_shapes
:
��*
dtype022
0hidden2/kernel/Regularizer/Square/ReadVariableOp�
!hidden2/kernel/Regularizer/SquareSquare8hidden2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
��2#
!hidden2/kernel/Regularizer/Square�
 hidden2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2"
 hidden2/kernel/Regularizer/Const�
hidden2/kernel/Regularizer/SumSum%hidden2/kernel/Regularizer/Square:y:0)hidden2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2 
hidden2/kernel/Regularizer/Sum�
 hidden2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��'72"
 hidden2/kernel/Regularizer/mul/x�
hidden2/kernel/Regularizer/mulMul)hidden2/kernel/Regularizer/mul/x:output:0'hidden2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2 
hidden2/kernel/Regularizer/mul�
0hidden3/kernel/Regularizer/Square/ReadVariableOpReadVariableOphidden3_8174286* 
_output_shapes
:
��*
dtype022
0hidden3/kernel/Regularizer/Square/ReadVariableOp�
!hidden3/kernel/Regularizer/SquareSquare8hidden3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
��2#
!hidden3/kernel/Regularizer/Square�
 hidden3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2"
 hidden3/kernel/Regularizer/Const�
hidden3/kernel/Regularizer/SumSum%hidden3/kernel/Regularizer/Square:y:0)hidden3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2 
hidden3/kernel/Regularizer/Sum�
 hidden3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��'72"
 hidden3/kernel/Regularizer/mul/x�
hidden3/kernel/Regularizer/mulMul)hidden3/kernel/Regularizer/mul/x:output:0'hidden3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2 
hidden3/kernel/Regularizer/mul�
IdentityIdentity'output/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������2

Identity�
NoOpNoOp ^dropout/StatefulPartitionedCall"^dropout_1/StatefulPartitionedCall"^dropout_2/StatefulPartitionedCall ^hidden1/StatefulPartitionedCall1^hidden1/kernel/Regularizer/Square/ReadVariableOp ^hidden2/StatefulPartitionedCall1^hidden2/kernel/Regularizer/Square/ReadVariableOp ^hidden3/StatefulPartitionedCall1^hidden3/kernel/Regularizer/Square/ReadVariableOp^output/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������: : : : : : : : 2B
dropout/StatefulPartitionedCalldropout/StatefulPartitionedCall2F
!dropout_1/StatefulPartitionedCall!dropout_1/StatefulPartitionedCall2F
!dropout_2/StatefulPartitionedCall!dropout_2/StatefulPartitionedCall2B
hidden1/StatefulPartitionedCallhidden1/StatefulPartitionedCall2d
0hidden1/kernel/Regularizer/Square/ReadVariableOp0hidden1/kernel/Regularizer/Square/ReadVariableOp2B
hidden2/StatefulPartitionedCallhidden2/StatefulPartitionedCall2d
0hidden2/kernel/Regularizer/Square/ReadVariableOp0hidden2/kernel/Regularizer/Square/ReadVariableOp2B
hidden3/StatefulPartitionedCallhidden3/StatefulPartitionedCall2d
0hidden3/kernel/Regularizer/Square/ReadVariableOp0hidden3/kernel/Regularizer/Square/ReadVariableOp2@
output/StatefulPartitionedCalloutput/StatefulPartitionedCall:V R
'
_output_shapes
:���������
'
_user_specified_namehidden1_input
�
d
F__inference_dropout_2_layer_call_and_return_conditional_losses_8174687

inputs

identity_1[
IdentityIdentityinputs*
T0*(
_output_shapes
:����������2

Identityj

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:����������2

Identity_1"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
e
F__inference_dropout_2_layer_call_and_return_conditional_losses_8174039

inputs
identity�c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @2
dropout/Constt
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:����������2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape�
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:����������*
dtype0*
seed��2&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?2
dropout/GreaterEqual/y�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:����������2
dropout/GreaterEqual�
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:����������2
dropout/Cast{
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:����������2
dropout/Mul_1f
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:����������2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�

�
,__inference_sequential_layer_call_fn_8174226
hidden1_input
unknown:	�
	unknown_0:	�
	unknown_1:
��
	unknown_2:	�
	unknown_3:
��
	unknown_4:	�
	unknown_5:	�
	unknown_6:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallhidden1_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������**
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8� *P
fKRI
G__inference_sequential_layer_call_and_return_conditional_losses_81741862
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:V R
'
_output_shapes
:���������
'
_user_specified_namehidden1_input
�
b
D__inference_dropout_layer_call_and_return_conditional_losses_8174569

inputs

identity_1[
IdentityIdentityinputs*
T0*(
_output_shapes
:����������2

Identityj

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:����������2

Identity_1"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
d
+__inference_dropout_2_layer_call_fn_8174709

inputs
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *O
fJRH
F__inference_dropout_2_layer_call_and_return_conditional_losses_81740392
StatefulPartitionedCall|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:����������2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
__inference_loss_fn_1_8174751M
9hidden2_kernel_regularizer_square_readvariableop_resource:
��
identity��0hidden2/kernel/Regularizer/Square/ReadVariableOp�
0hidden2/kernel/Regularizer/Square/ReadVariableOpReadVariableOp9hidden2_kernel_regularizer_square_readvariableop_resource* 
_output_shapes
:
��*
dtype022
0hidden2/kernel/Regularizer/Square/ReadVariableOp�
!hidden2/kernel/Regularizer/SquareSquare8hidden2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
��2#
!hidden2/kernel/Regularizer/Square�
 hidden2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2"
 hidden2/kernel/Regularizer/Const�
hidden2/kernel/Regularizer/SumSum%hidden2/kernel/Regularizer/Square:y:0)hidden2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2 
hidden2/kernel/Regularizer/Sum�
 hidden2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��'72"
 hidden2/kernel/Regularizer/mul/x�
hidden2/kernel/Regularizer/mulMul)hidden2/kernel/Regularizer/mul/x:output:0'hidden2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2 
hidden2/kernel/Regularizer/mull
IdentityIdentity"hidden2/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: 2

Identity�
NoOpNoOp1^hidden2/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2d
0hidden2/kernel/Regularizer/Square/ReadVariableOp0hidden2/kernel/Regularizer/Square/ReadVariableOp
�
b
)__inference_dropout_layer_call_fn_8174591

inputs
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_dropout_layer_call_and_return_conditional_losses_81741052
StatefulPartitionedCall|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:����������2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�

�
,__inference_sequential_layer_call_fn_8174009
hidden1_input
unknown:	�
	unknown_0:	�
	unknown_1:
��
	unknown_2:	�
	unknown_3:
��
	unknown_4:	�
	unknown_5:	�
	unknown_6:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallhidden1_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������**
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8� *P
fKRI
G__inference_sequential_layer_call_and_return_conditional_losses_81739902
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:V R
'
_output_shapes
:���������
'
_user_specified_namehidden1_input
�
G
+__inference_dropout_2_layer_call_fn_8174704

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *O
fJRH
F__inference_dropout_2_layer_call_and_return_conditional_losses_81739522
PartitionedCallm
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:����������2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
G
+__inference_dropout_1_layer_call_fn_8174645

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *O
fJRH
F__inference_dropout_1_layer_call_and_return_conditional_losses_81739222
PartitionedCallm
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:����������2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs"�L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*�
serving_default�
G
hidden1_input6
serving_default_hidden1_input:0���������:
output0
StatefulPartitionedCall:0���������tensorflow/serving/predict:��
�
layer_with_weights-0
layer-0
layer-1
layer_with_weights-1
layer-2
layer-3
layer_with_weights-2
layer-4
layer-5
layer_with_weights-3
layer-6
	optimizer
		variables

regularization_losses
trainable_variables
	keras_api

signatures
+�&call_and_return_all_conditional_losses
�__call__
�_default_save_signature"
_tf_keras_sequential
�

kernel
bias
trainable_variables
	variables
regularization_losses
	keras_api
+�&call_and_return_all_conditional_losses
�__call__"
_tf_keras_layer
�
trainable_variables
	variables
regularization_losses
	keras_api
+�&call_and_return_all_conditional_losses
�__call__"
_tf_keras_layer
�

kernel
bias
trainable_variables
	variables
regularization_losses
	keras_api
+�&call_and_return_all_conditional_losses
�__call__"
_tf_keras_layer
�
trainable_variables
	variables
 regularization_losses
!	keras_api
+�&call_and_return_all_conditional_losses
�__call__"
_tf_keras_layer
�

"kernel
#bias
$trainable_variables
%	variables
&regularization_losses
'	keras_api
+�&call_and_return_all_conditional_losses
�__call__"
_tf_keras_layer
�
(trainable_variables
)	variables
*regularization_losses
+	keras_api
+�&call_and_return_all_conditional_losses
�__call__"
_tf_keras_layer
�

,kernel
-bias
.trainable_variables
/	variables
0regularization_losses
1	keras_api
+�&call_and_return_all_conditional_losses
�__call__"
_tf_keras_layer
�
2iter

3beta_1

4beta_2
	5decay
6learning_ratemm�m�m�"m�#m�,m�-m�v�v�v�v�"v�#v�,v�-v�"
	optimizer
X
0
1
2
3
"4
#5
,6
-7"
trackable_list_wrapper
8
�0
�1
�2"
trackable_list_wrapper
X
0
1
2
3
"4
#5
,6
-7"
trackable_list_wrapper
�

7layers
8layer_regularization_losses
9non_trainable_variables
		variables

regularization_losses
trainable_variables
:metrics
;layer_metrics
�__call__
�_default_save_signature
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
-
�serving_default"
signature_map
!:	�2hidden1/kernel
:�2hidden1/bias
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
(
�0"
trackable_list_wrapper
�

<layers
=layer_regularization_losses
trainable_variables
	variables
regularization_losses
>non_trainable_variables
?metrics
@layer_metrics
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�

Alayers
Blayer_regularization_losses
trainable_variables
	variables
regularization_losses
Cnon_trainable_variables
Dmetrics
Elayer_metrics
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
": 
��2hidden2/kernel
:�2hidden2/bias
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
(
�0"
trackable_list_wrapper
�

Flayers
Glayer_regularization_losses
trainable_variables
	variables
regularization_losses
Hnon_trainable_variables
Imetrics
Jlayer_metrics
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�

Klayers
Llayer_regularization_losses
trainable_variables
	variables
 regularization_losses
Mnon_trainable_variables
Nmetrics
Olayer_metrics
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
": 
��2hidden3/kernel
:�2hidden3/bias
.
"0
#1"
trackable_list_wrapper
.
"0
#1"
trackable_list_wrapper
(
�0"
trackable_list_wrapper
�

Players
Qlayer_regularization_losses
$trainable_variables
%	variables
&regularization_losses
Rnon_trainable_variables
Smetrics
Tlayer_metrics
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�

Ulayers
Vlayer_regularization_losses
(trainable_variables
)	variables
*regularization_losses
Wnon_trainable_variables
Xmetrics
Ylayer_metrics
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 :	�2output/kernel
:2output/bias
.
,0
-1"
trackable_list_wrapper
.
,0
-1"
trackable_list_wrapper
 "
trackable_list_wrapper
�

Zlayers
[layer_regularization_losses
.trainable_variables
/	variables
0regularization_losses
\non_trainable_variables
]metrics
^layer_metrics
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
:	 (2	Adam/iter
: (2Adam/beta_1
: (2Adam/beta_2
: (2
Adam/decay
: (2Adam/learning_rate
Q
0
1
2
3
4
5
6"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
C
_0
`1
a2
b3
c4"
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
(
�0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
(
�0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
(
�0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
N
	dtotal
	ecount
f	variables
g	keras_api"
_tf_keras_metric
�
htrue_positives
itrue_negatives
jfalse_positives
kfalse_negatives
l
thresholds
m	variables
n	keras_api"
_tf_keras_metric
q
o
thresholds
ptrue_positives
qfalse_negatives
r	variables
s	keras_api"
_tf_keras_metric
q
t
thresholds
utrue_positives
vfalse_positives
w	variables
x	keras_api"
_tf_keras_metric
�
ytrue_positives
ztrue_negatives
{false_positives
|false_negatives
}	variables
~	keras_api"
_tf_keras_metric
:  (2total
:  (2count
.
d0
e1"
trackable_list_wrapper
-
f	variables"
_generic_user_object
:� (2true_positives
:� (2true_negatives
 :� (2false_positives
 :� (2false_negatives
 "
trackable_list_wrapper
<
h0
i1
j2
k3"
trackable_list_wrapper
-
m	variables"
_generic_user_object
 "
trackable_list_wrapper
: (2true_positives
: (2false_negatives
.
p0
q1"
trackable_list_wrapper
-
r	variables"
_generic_user_object
 "
trackable_list_wrapper
: (2true_positives
: (2false_positives
.
u0
v1"
trackable_list_wrapper
-
w	variables"
_generic_user_object
:� (2true_positives
:� (2true_negatives
 :� (2false_positives
 :� (2false_negatives
<
y0
z1
{2
|3"
trackable_list_wrapper
-
}	variables"
_generic_user_object
&:$	�2Adam/hidden1/kernel/m
 :�2Adam/hidden1/bias/m
':%
��2Adam/hidden2/kernel/m
 :�2Adam/hidden2/bias/m
':%
��2Adam/hidden3/kernel/m
 :�2Adam/hidden3/bias/m
%:#	�2Adam/output/kernel/m
:2Adam/output/bias/m
&:$	�2Adam/hidden1/kernel/v
 :�2Adam/hidden1/bias/v
':%
��2Adam/hidden2/kernel/v
 :�2Adam/hidden2/bias/v
':%
��2Adam/hidden3/kernel/v
 :�2Adam/hidden3/bias/v
%:#	�2Adam/output/kernel/v
:2Adam/output/bias/v
�2�
G__inference_sequential_layer_call_and_return_conditional_losses_8174416
G__inference_sequential_layer_call_and_return_conditional_losses_8174490
G__inference_sequential_layer_call_and_return_conditional_losses_8174271
G__inference_sequential_layer_call_and_return_conditional_losses_8174316�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
,__inference_sequential_layer_call_fn_8174009
,__inference_sequential_layer_call_fn_8174511
,__inference_sequential_layer_call_fn_8174532
,__inference_sequential_layer_call_fn_8174226�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�B�
"__inference__wrapped_model_8173857hidden1_input"�
���
FullArgSpec
args� 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
D__inference_hidden1_layer_call_and_return_conditional_losses_8174555�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
)__inference_hidden1_layer_call_fn_8174564�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
D__inference_dropout_layer_call_and_return_conditional_losses_8174569
D__inference_dropout_layer_call_and_return_conditional_losses_8174581�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
)__inference_dropout_layer_call_fn_8174586
)__inference_dropout_layer_call_fn_8174591�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
D__inference_hidden2_layer_call_and_return_conditional_losses_8174614�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
)__inference_hidden2_layer_call_fn_8174623�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
F__inference_dropout_1_layer_call_and_return_conditional_losses_8174628
F__inference_dropout_1_layer_call_and_return_conditional_losses_8174640�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
+__inference_dropout_1_layer_call_fn_8174645
+__inference_dropout_1_layer_call_fn_8174650�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
D__inference_hidden3_layer_call_and_return_conditional_losses_8174673�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
)__inference_hidden3_layer_call_fn_8174682�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
F__inference_dropout_2_layer_call_and_return_conditional_losses_8174687
F__inference_dropout_2_layer_call_and_return_conditional_losses_8174699�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
+__inference_dropout_2_layer_call_fn_8174704
+__inference_dropout_2_layer_call_fn_8174709�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
C__inference_output_layer_call_and_return_conditional_losses_8174720�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
(__inference_output_layer_call_fn_8174729�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
__inference_loss_fn_0_8174740�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_1_8174751�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_2_8174762�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�B�
%__inference_signature_wrapper_8174363hidden1_input"�
���
FullArgSpec
args� 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 �
"__inference__wrapped_model_8173857s"#,-6�3
,�)
'�$
hidden1_input���������
� "/�,
*
output �
output����������
F__inference_dropout_1_layer_call_and_return_conditional_losses_8174628^4�1
*�'
!�
inputs����������
p 
� "&�#
�
0����������
� �
F__inference_dropout_1_layer_call_and_return_conditional_losses_8174640^4�1
*�'
!�
inputs����������
p
� "&�#
�
0����������
� �
+__inference_dropout_1_layer_call_fn_8174645Q4�1
*�'
!�
inputs����������
p 
� "������������
+__inference_dropout_1_layer_call_fn_8174650Q4�1
*�'
!�
inputs����������
p
� "������������
F__inference_dropout_2_layer_call_and_return_conditional_losses_8174687^4�1
*�'
!�
inputs����������
p 
� "&�#
�
0����������
� �
F__inference_dropout_2_layer_call_and_return_conditional_losses_8174699^4�1
*�'
!�
inputs����������
p
� "&�#
�
0����������
� �
+__inference_dropout_2_layer_call_fn_8174704Q4�1
*�'
!�
inputs����������
p 
� "������������
+__inference_dropout_2_layer_call_fn_8174709Q4�1
*�'
!�
inputs����������
p
� "������������
D__inference_dropout_layer_call_and_return_conditional_losses_8174569^4�1
*�'
!�
inputs����������
p 
� "&�#
�
0����������
� �
D__inference_dropout_layer_call_and_return_conditional_losses_8174581^4�1
*�'
!�
inputs����������
p
� "&�#
�
0����������
� ~
)__inference_dropout_layer_call_fn_8174586Q4�1
*�'
!�
inputs����������
p 
� "�����������~
)__inference_dropout_layer_call_fn_8174591Q4�1
*�'
!�
inputs����������
p
� "������������
D__inference_hidden1_layer_call_and_return_conditional_losses_8174555]/�,
%�"
 �
inputs���������
� "&�#
�
0����������
� }
)__inference_hidden1_layer_call_fn_8174564P/�,
%�"
 �
inputs���������
� "������������
D__inference_hidden2_layer_call_and_return_conditional_losses_8174614^0�-
&�#
!�
inputs����������
� "&�#
�
0����������
� ~
)__inference_hidden2_layer_call_fn_8174623Q0�-
&�#
!�
inputs����������
� "������������
D__inference_hidden3_layer_call_and_return_conditional_losses_8174673^"#0�-
&�#
!�
inputs����������
� "&�#
�
0����������
� ~
)__inference_hidden3_layer_call_fn_8174682Q"#0�-
&�#
!�
inputs����������
� "�����������<
__inference_loss_fn_0_8174740�

� 
� "� <
__inference_loss_fn_1_8174751�

� 
� "� <
__inference_loss_fn_2_8174762"�

� 
� "� �
C__inference_output_layer_call_and_return_conditional_losses_8174720],-0�-
&�#
!�
inputs����������
� "%�"
�
0���������
� |
(__inference_output_layer_call_fn_8174729P,-0�-
&�#
!�
inputs����������
� "�����������
G__inference_sequential_layer_call_and_return_conditional_losses_8174271q"#,->�;
4�1
'�$
hidden1_input���������
p 

 
� "%�"
�
0���������
� �
G__inference_sequential_layer_call_and_return_conditional_losses_8174316q"#,->�;
4�1
'�$
hidden1_input���������
p

 
� "%�"
�
0���������
� �
G__inference_sequential_layer_call_and_return_conditional_losses_8174416j"#,-7�4
-�*
 �
inputs���������
p 

 
� "%�"
�
0���������
� �
G__inference_sequential_layer_call_and_return_conditional_losses_8174490j"#,-7�4
-�*
 �
inputs���������
p

 
� "%�"
�
0���������
� �
,__inference_sequential_layer_call_fn_8174009d"#,->�;
4�1
'�$
hidden1_input���������
p 

 
� "�����������
,__inference_sequential_layer_call_fn_8174226d"#,->�;
4�1
'�$
hidden1_input���������
p

 
� "�����������
,__inference_sequential_layer_call_fn_8174511]"#,-7�4
-�*
 �
inputs���������
p 

 
� "�����������
,__inference_sequential_layer_call_fn_8174532]"#,-7�4
-�*
 �
inputs���������
p

 
� "�����������
%__inference_signature_wrapper_8174363�"#,-G�D
� 
=�:
8
hidden1_input'�$
hidden1_input���������"/�,
*
output �
output���������