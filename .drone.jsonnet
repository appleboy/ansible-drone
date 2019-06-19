local pipeline = import 'pipeline.libsonnet';
local name = 'drone-facebook';

[
  pipeline.build('2.4', 'linux', 'amd64'),
  pipeline.build('2.5', 'linux', 'amd64'),
  pipeline.build('2.6', 'linux', 'amd64'),
  pipeline.build('2.7', 'linux', 'amd64'),
]
