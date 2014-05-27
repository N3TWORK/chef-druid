# Copyright 2014 N3TWORK, Inc.
#
# Licensed under Apache 2.0 - see the LICENSE file

actions :install
default_action :install

attribute :node_type, :kind_of => String, :name_attribute => true, :required => true
