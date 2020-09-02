#!/bin/bash

ACTION=$1
STACK="capstone-jupyter-notebook-on-ec2"
TEMPLATE="jupyter-notebook-ec2.template"
PARAMS="parameters.json"

./run.sh $ACTION $STACK $TEMPLATE $PARAMS
