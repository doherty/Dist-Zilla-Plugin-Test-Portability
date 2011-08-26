
use strict;
use warnings;

use 5.008;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Release tests for portability",
  "AUTHOR" => "Marcel Gruenauer <marcel\@cpan.org>, Randy Stauner <rwstauner\@cpan.org>, Mike Doherty <doherty\@cpan.org>",
  "BUILD_REQUIRES" => {
    "File::Find" => 0,
    "File::Path" => 0,
    "File::Temp" => 0,
    "Module::Build" => "0.3601",
    "Moose::Autobox" => 0,
    "Test::DZil" => 0,
    "Test::More" => "0.96",
    "Test::Output" => 0,
    "autodie" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30",
    "Module::Build" => "0.3601"
  },
  "DISTNAME" => "Dist-Zilla-Plugin-Test-Portability",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Dist::Zilla::Plugin::Test::Portability",
  "PREREQ_PM" => {
    "Dist::Zilla::Plugin::InlineFiles" => 0,
    "Dist::Zilla::Role::FileMunger" => 0,
    "Moose" => 0,
    "Test::Portability::Files" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "v2.0.0",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);


