STACK_NAME=k8s-cluster-2048
REGION=us-east-2

echo "Deploying stack..."
if ! aws cloudformation describe-stacks --region $REGION --stack-name $STACK_NAME ; then
  echo "Creating stack..."
  aws cloudformation create-stack \
  --stack-name $STACK_NAME \
  --template-body file://stack.yaml \
  --parameters file://parameters.json \
  --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" \
  --region=$REGION
else
  echo "Updating stack..."
  aws cloudformation update-stack \
  --stack-name $STACK_NAME \
  --template-body file://stack.yaml \
  --parameters file://parameters.json \
  --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" \
  --region=$REGION
fi