PORT_FWD_CMD = kubectl port-forward svc/jenkins --address 0.0.0.0 8080:8080
PORT_FWD_LOG = /tmp/kubectl-jenkins-port-forward.log
PORT_FWD_PID = /tmp/kubectl-jenkins-port-forward.pid

.PHONY: help setup cleanup k3s-server-setup k3s-server-cleanup k3s-server-reset k3s-agent-setup k3s-agent-cleanup k3s-agent-reset jenkins-setup jenkins-cleanup jenkins-cli-setup jenkins-cli-cleanup port-fwd-start port-fwd-stop port-fwd-restart port-fwd-status jenkins-endpoint admin-password

.DEFAULT_GOAL := help

help: ## Available commands
	@echo "Available commands:"
	@printf "\033[36m%-30s\033[0m %s\n" "setup" "Setup the entire environment"
	@printf "\033[36m%-30s\033[0m %s\n" "cleanup" "Cleanup the entire environment"
	@printf "\033[36m%-30s\033[0m %s\n" "k3s-server-reset" "Reset K3s server node"
	@printf "\033[36m%-30s\033[0m %s\n" "k3s-agent-reset" "Reset K3s agent node"
	@printf "\033[36m%-30s\033[0m %s\n" "port-fwd-restart" "Reset Port Forwarding"
	@grep -E '^[a-zA-Z0-9_-]+:[[:space:]]*## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "} {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

setup: jenkins-setup jenkins-cli-setup port-fwd-start jenkins-endpoint admin-password ## Setup the entire environment

cleanup: port-fwd-stop jenkins-cli-cleanup jenkins-cleanup ## Cleanup the entire environment

k3s-server-setup: ## Setup K3s server node
	chmod +x k3s/server/setup.sh
	./k3s/server/setup.sh

k3s-server-cleanup: ## Cleanup K3s server node
	chmod +x k3s/server/cleanup.sh
	./k3s/server/cleanup.sh

k3s-server-reset: k3s-server-cleanup k3s-server-setup ## Reset K3s server node

k3s-agent-setup: ## Setup K3s agent node
	chmod +x k3s/agent/setup.sh
	./k3s/agent/setup.sh

k3s-agent-cleanup: ## Cleanup K3s agent node
	chmod +x k3s/agent/cleanup.sh
	./k3s/agent/cleanup.sh

k3s-agent-reset: k3s-agent-cleanup k3s-agent-setup ## Reset K3s agent node

jenkins-setup: ## Setup Jenkins
	chmod +x jenkins/setup.sh
	./jenkins/setup.sh

jenkins-cleanup: ## Cleanup Jenkins
	chmod +x jenkins/cleanup.sh
	./jenkins/cleanup.sh

jenkins-cli-setup: ## Setup Jenkins CLI
	chmod +x jenkins-cli/setup.sh
	./jenkins-cli/setup.sh

jenkins-cli-cleanup: ## Cleanup Jenkins CLI
	chmod +x jenkins-cli/cleanup.sh
	./jenkins-cli/cleanup.sh

port-fwd-start: ## Start Port Forwarding
	@echo "Starting port-forwarding..."
	@$(PORT_FWD_CMD) > $(PORT_FWD_LOG) 2>&1 & echo $$! > $(PORT_FWD_PID)
	@sleep 2
	@echo "Port-forwarding started (PID: $$(cat $(PORT_FWD_PID)))"

port-fwd-stop: ## Stop Port Forwarding
	@if [ -f $(PORT_FWD_PID) ]; then \
		echo "Stopping port-forwarding (PID: $$(cat $(PORT_FWD_PID)))..."; \
		kill $$(cat $(PORT_FWD_PID)) && rm -f $(PORT_FWD_PID); \
		echo "Port-forwarding stopped."; \
	else \
		echo "No active port-forwarding found."; \
	fi

port-fwd-restart: port-fwd-stop port-fwd-start

port-fwd-status: ## Get Status of Port Forwarding
	@if [ -f $(PORT_FWD_PID) ]; then \
		echo "Port-forwarding is running (PID: $$(cat $(PORT_FWD_PID)))"; \
	else \
		echo "Port-forwarding is not running."; \
	fi

jenkins-endpoint: ## Get Jenkins Endpoint
	chmod +x jenkins/endpoint.sh
	./jenkins/endpoint.sh

admin-password: ## Get Jenkins Admin Password
	echo "Username: admin"
	kubectl exec -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password && echo
