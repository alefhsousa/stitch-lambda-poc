
layer_folder ?= lambda-layer/python

# how to use this command
# make deploy file=stitch.yaml stack=stitch-lambda
#
deploy:
	aws cloudformation deploy --template-file $(file) --stack-name $(stack) --capabilities CAPABILITY_NAMED_IAM


# how to use this command
# make destroy stack=stitch-lambda
#
destroy:
	aws cloudformation delete-stack --stack-name $(stack)


create-layer:
	mkdir -p $(layer_folder)
	pip install --prefix $(layer_folder) requests
	zip -vr lambda-layer.zip $(layer_folder)