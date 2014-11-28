# encoding: UTF-8
#
# Copyright 2014, Deutsche Telekom AG
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

require_relative '../spec_helper'

describe 'os-hardening::securetty' do

  let(:chef_run) do
    ChefSpec::ServerRunner.new.converge(described_recipe)
  end

  it 'creates /etc/securetty' do
    expect(chef_run).to create_template('/etc/securetty').with(
      user:   'root',
      group:  'root',
      mode: '0400'
    )
  end

end
