# Changelog

All notable changes to this project will be documented in this file.
Each new release typically also includes the latest modulesync defaults.
These should not affect the functionality of the module.

## [v5.0.0](https://github.com/voxpupuli/puppet-mysql_java_connector/tree/v5.0.0) (2022-11-09)

[Full Changelog](https://github.com/voxpupuli/puppet-mysql_java_connector/compare/v4.0.0...v5.0.0)

**Breaking changes:**

- Remove puppet 5 support; Add Puppet 7 support [\#77](https://github.com/voxpupuli/puppet-mysql_java_connector/pull/77) ([h-haaks](https://github.com/h-haaks))
- CentOS: Drop EoL 6 support [\#73](https://github.com/voxpupuli/puppet-mysql_java_connector/pull/73) ([bastelfreak](https://github.com/bastelfreak))

**Implemented enhancements:**

- puppet/archive: allow 5.x [\#72](https://github.com/voxpupuli/puppet-mysql_java_connector/pull/72) ([bastelfreak](https://github.com/bastelfreak))

**Merged pull requests:**

- Allow stdlib 8 and archive 6 [\#74](https://github.com/voxpupuli/puppet-mysql_java_connector/pull/74) ([smortex](https://github.com/smortex))
- modulesync 3.0.0 & puppet-lint updates [\#69](https://github.com/voxpupuli/puppet-mysql_java_connector/pull/69) ([bastelfreak](https://github.com/bastelfreak))
- Use voxpupuli-acceptance [\#68](https://github.com/voxpupuli/puppet-mysql_java_connector/pull/68) ([ekohl](https://github.com/ekohl))

## [v4.0.0](https://github.com/voxpupuli/puppet-mysql_java_connector/tree/v4.0.0) (2020-04-05)

[Full Changelog](https://github.com/voxpupuli/puppet-mysql_java_connector/compare/v3.0.2...v4.0.0)

**Breaking changes:**

- drop Ubuntu 14.04 support / Add Ubuntu 18.04 support [\#62](https://github.com/voxpupuli/puppet-mysql_java_connector/pull/62) ([bastelfreak](https://github.com/bastelfreak))
- modulesync 2.7.0 and drop puppet 4 [\#57](https://github.com/voxpupuli/puppet-mysql_java_connector/pull/57) ([bastelfreak](https://github.com/bastelfreak))

**Merged pull requests:**

- Remove duplicate CONTRIBUTING.md file [\#63](https://github.com/voxpupuli/puppet-mysql_java_connector/pull/63) ([dhoppe](https://github.com/dhoppe))
- Clean up acceptance spec helper [\#61](https://github.com/voxpupuli/puppet-mysql_java_connector/pull/61) ([ekohl](https://github.com/ekohl))
- Allow `puppetlabs/stdlib` 6.x and `puppet/archive` 4.x [\#59](https://github.com/voxpupuli/puppet-mysql_java_connector/pull/59) ([alexjfisher](https://github.com/alexjfisher))
- modulesync 2.2.0 and allow puppet 6.x [\#54](https://github.com/voxpupuli/puppet-mysql_java_connector/pull/54) ([bastelfreak](https://github.com/bastelfreak))

## [v3.0.2](https://github.com/voxpupuli/puppet-mysql_java_connector/tree/v3.0.2) (2018-09-09)

[Full Changelog](https://github.com/voxpupuli/puppet-mysql_java_connector/compare/v3.0.1...v3.0.2)

**Merged pull requests:**

- allow puppet/archive 3.x [\#52](https://github.com/voxpupuli/puppet-mysql_java_connector/pull/52) ([bastelfreak](https://github.com/bastelfreak))
- allow puppetlabs/stdlib 5.x [\#50](https://github.com/voxpupuli/puppet-mysql_java_connector/pull/50) ([bastelfreak](https://github.com/bastelfreak))
- Remove docker nodesets [\#46](https://github.com/voxpupuli/puppet-mysql_java_connector/pull/46) ([bastelfreak](https://github.com/bastelfreak))
- drop EOL OSs; fix puppet version range [\#44](https://github.com/voxpupuli/puppet-mysql_java_connector/pull/44) ([bastelfreak](https://github.com/bastelfreak))

## [v3.0.1](https://github.com/voxpupuli/puppet-mysql_java_connector/tree/v3.0.1) (2018-03-29)

[Full Changelog](https://github.com/voxpupuli/puppet-mysql_java_connector/compare/v3.0.0...v3.0.1)

**Merged pull requests:**

- Bump puppet dependency to minimum supported version 4.10.0 [\#42](https://github.com/voxpupuli/puppet-mysql_java_connector/pull/42) ([bastelfreak](https://github.com/bastelfreak))
- Correcting samples/info in readme to match init.pp [\#40](https://github.com/voxpupuli/puppet-mysql_java_connector/pull/40) ([DrRhythm](https://github.com/DrRhythm))

## [v3.0.0](https://github.com/voxpupuli/puppet-mysql_java_connector/tree/v3.0.0) (2017-10-13)

[Full Changelog](https://github.com/voxpupuli/puppet-mysql_java_connector/compare/v2.3.0...v3.0.0)

**Breaking changes:**

- BREAKING: Drop puppet 3 support. Replace validate\_\* with datatypes [\#34](https://github.com/voxpupuli/puppet-mysql_java_connector/pull/34) ([bastelfreak](https://github.com/bastelfreak))

**Implemented enhancements:**

- Adding proxy support [\#36](https://github.com/voxpupuli/puppet-mysql_java_connector/pull/36) ([bt-lemery](https://github.com/bt-lemery))

## [v2.3.0](https://github.com/voxpupuli/puppet-mysql_java_connector/tree/v2.3.0) (2017-01-13)

This is the last release with Puppet 3 support!
* Modulesync with latest Vox Pupuli defaults
* Fix several markdown issues
* Add missing badges
* rubocop: fix RSpec/ImplicitExpect
* Bump min version_requirement for Puppet + deps

## 2016-10-06 - Release 2.2.0

### **Major bug fix release**

Versions 2.0.0 to 2.1.1 were broken for most users.

* [GH-11](https://github.com/voxpupuli/puppet-mysql_java_connector/issues/11) Fix missing `archive` `extract_path`

## 2016-10-05 - Release 2.1.1

- Release of 2.1.0 again, which didn't make it to the forge on the first try

## 2016-10-05 - Release 2.1.0

- Modulesync with latest Vox Pupuli defaults
- Enhance spec test code quality
- Bump default connector version to 5.1.40
- validate $links with validate_array()

## 2016-05-21 - Release 2.0.0

- released under the voxpupuli namespace
- modulesync with voxpupuli defaults (0.6.2)
- bump default java version from 5.1.34 to 5.1.38
- rename parameter downloadURL to downloadurl
- replace staging with archive
- add support for STRICT_VARIABLES


## 2015-07-14 - Release 1.0.0

- First Release (by Merritt Krakowitzer)


\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
