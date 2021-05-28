# CI Pipeline Explaination

1. "Name" : This will help to give name to each build like build number

2. Trigger:
    Trigger parameter allows us to set automatic trigger for build based on push in particular branches
 For example,
 In our case we need to set automatic trigger whenever developer push the code on master, we can get:

 #### Code ####
 trigger:
  branches:
    include:
      - 'master'
################      

3. Variables:
    in this block, we can create different variables that can be used throghout the pipeline

4. Stages:
    We can create different stages for our pipeline and set the build status bsed on stages:
    In our case, I have created 2 stages namely "Build" and "Test".

    In Build Stage, we perform build steps to build the WebAPI and Web application Projects

    In Test stage, we run the tests from Test project, and whenever any test fails this stage is failed and it restrict the build to be completed successfully.
