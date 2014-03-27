# Downloading
default[:druid][:version] = "0.6.52"
default[:druid][:mirror] = "http://static.druid.io/artifacts/releases"
default[:druid][:checksum] = "8ecd2886f4d954cfbc410fe50bdaf250b7751c5a9e7cd18d4d291938f753c549"

# Installation
default[:druid][:user] = "druid"
default[:druid][:group] = "druid"
default[:druid][:install_dir] = "/opt/druid"
default[:druid][:config_dir] = "/etc/druid"

# Configuration defaults
default[:druid][:log_to_syslog] = 1
default[:druid][:properties][:"druid.host"] = node[:ipaddress]
default[:druid][:timezone] = "UTC"
default[:druid][:encoding] = "UTF-8"
default[:druid][:java_opts] = "-Xmx1G"
default[:druid][:extra_classpath] = ""

# Type-specific defaults
default[:druid][:broker][:properties]["druid.port"] = 8080
default[:druid][:coordinator][:properties]["druid.port"] = 8081
default[:druid][:realtime][:properties]["druid.port"] = 8082
default[:druid][:historical][:properties]["druid.port"] = 8083
default[:druid][:overlord][:properties]["druid.port"] = 8084
default[:druid][:indexer][:properties]["druid.port"] = 8085
default[:druid][:middleManager][:properties]["druid.port"] = 8086

# Other
default['java']['jdk_version'] = '7'


