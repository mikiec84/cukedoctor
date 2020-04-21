# order: 4
Feature: Tag rendering

  Scenario: Render feature tags in that feature's scenarios

    Given The following two features:
"""
@someTag
Feature: Feature1

  @otherTag
  Scenario: Scenario feature 1

    Given scenario step

  @someTag @otherTag
  Scenario: Scenario feature 2

    Given scenario step
"""

    When I render the feature

    Then the tags displayed under each scenario should not have duplicates
"""
== *Features*

[[Feature1, Feature1]]
=== *Feature1*

==== Scenario: Scenario feature 1
[small]#tags: @someTag,@otherTag#


==========
Given ::
scenario step icon:thumbs-up[role="green",title="Passed"] [small right]#(001ms)#
==========

==== Scenario: Scenario feature 2
[small]#tags: @someTag,@otherTag#


==========
Given ::
scenario step icon:thumbs-up[role="green",title="Passed"] [small right]#(000ms)#
==========


"""