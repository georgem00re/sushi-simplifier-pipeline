
generate-fhir-resources:
	NVM_DIR="$${HOME}/.nvm" && . "$${NVM_DIR}/nvm.sh" && cd ExampleIG && nvm use 20 && sushi .

# Act (https://github.com/nektos/act) is used to run GH Actions workflows locally.

macos-install-act:
	brew install act

verify-act-install:
	act --version

run-workflow-locally:
	act -W .github/workflows/run-sushi-and-push-to-simplifier-on-dispatch.yml workflow_dispatch \
	--secret-file .env \
	-P ubuntu-latest=ghcr.io/catthehacker/ubuntu:act-latest \
	--container-architecture linux/amd64
