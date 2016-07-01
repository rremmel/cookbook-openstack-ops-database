# encoding: UTF-8
#
# Cookbook Name:: openstack-ops-database
# Recipe:: postgresql-server
#
# Copyright 2013, Opscode, Inc.
# Copyright 2012-2013, Rackspace US, Inc.
# Copyright 2013, AT&T Services, Inc.
# Copyright 2013, SUSE Linux GmbH
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

class ::Chef::Recipe # rubocop:disable Documentation
  include ::Openstack
end

bind_db = node['openstack']['bind_service']['db']
listen_address = if bind_db['interface']
                   address_for bind_db['interface']
                 else
                   bind_db['host']
                 end

node.override['postgresql']['config']['listen_addresses'] = listen_address

include_recipe 'openstack-ops-database::postgresql-client'
include_recipe 'postgresql::server'
