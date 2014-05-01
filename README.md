Druid Cookbook
==============
Installs and configures the [Druid](http://druid.io/) real-time analytics system

Requirements
------------
This cookbook is for Debian-based linux systems. It has been tested with Ubuntu using Vagrant as well as Amazon's AWS OpsWorks. Services are managed via *upstart*.

Recipes
----------
There is one recipe per Druid service:

* broker
* coordinator
* historical
* middleManager
* overlord
* peon (rarely needed)
* realtime
* router (upcoming service)

Attributes
----------
Most attributes are simply passed through to Druid's runtime.properties files. See [attributes/default.rb](attributes/default.rb) for the others.


<table>
  <tr>
    <th>Key</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><tt>['druid']['properties'][<i>property name</i>]</tt></td>
    <td>properties which apply to all services</td>
  </tr>
  <tr>
    <td><tt>['druid'][<i>service name</i>]['properties'][<i>property name</i>]</tt></td>
    <td>properties which apply to one service</td>
  </tr>
</table>

Usage
-----
See the [druid-example](https://github.com/N3TWORK/chef-druid-example/) cookbook for a working example.

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Copyright 2014 N3TWORK, Inc.<br>
Licensed under Apache 2.0<br>
Written by Yuval Oren (yuval@n3twork.com)
