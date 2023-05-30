.DEFAULT_GOAL := total
.PHONY: init

SHELL := /bin/bash
ENTRY_FILE := entry.yml

total:
	ansible-playbook $(ENTRY_FILE)

init:
	ansible-playbook $(ENTRY_FILE) -t init

skip-init:
	ansible-playbook $(ENTRY_FILE) --skip-tags init

zsh:
	ansible-playbook $(ENTRY_FILE) -t zsh

python:
	ansible-playbook $(ENTRY_FILE) -t python

node:
	ansible-playbook $(ENTRY_FILE) -t node

golang:
	ansible-playbook $(ENTRY_FILE) -t golang

docker:
	ansible-playbook $(ENTRY_FILE) -t docker

ruby:
	ansible-playbook $(ENTRY_FILE) -t ruby

minikube:
	ansible-playbook $(ENTRY_FILE) -t minikube

k8s:	
	ansible-playbook $(ENTRY_FILE) -t k8s

lint:
	ansible-lint ./roles
