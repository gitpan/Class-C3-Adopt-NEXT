
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'make NEXT suck less',
  'AUTHOR' => 'Florian Ragwitz <rafl@debian.org>, Tomas Doran <bobtfish@bobtfish.net>',
  'BUILD_REQUIRES' => {
    'FindBin' => '0',
    'Test::Exception' => '0.27',
    'Test::More' => '0',
    'vars' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Class-C3-Adopt-NEXT',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Class::C3::Adopt::NEXT',
  'PREREQ_PM' => {
    'List::MoreUtils' => '0',
    'MRO::Compat' => '0',
    'NEXT' => '0',
    'warnings::register' => '0'
  },
  'VERSION' => '0.13',
  'test' => {
    'TESTS' => 't/*.t'
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



