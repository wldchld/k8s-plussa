:index-mode: toc
:enrollment-audience: all
:view-content-to: public
:course-description: <h1>K8s-plussa</h1>
    <p>
    <b>This is a demo course for a master's thesis about running Kubernetes exercises on Plussa platform.</b>
    </p>
    <p>
    The course is targeted for Tampere University's information technology students who are working on
    their master's degree. You must have a tuni.fi-email to access this course and the additional resources.
    This test course itself is not integrated to the Tampere University login system, so you will need
    other credentials for this. They will be provided to you if you decide to help with the testing.
    Reading the description and the material below is adviced, even if you do not have access to the course yet.
    </p>
    <p>
    <b>S-group gift cards will be drawn among the volunteers.</b> Valid submissions for the exercises and
    feedback about the provided material and the exercises are required to qualify for the raffle.
    </p>
    <p>
    For the tasks you need to independently familiarize yourself with Kubernetes. On this course we will use
    minikube to create a local Kubernetes cluster. You can use it in your own tests and it is used internally
    by the grading component on this course. A VirtualBox image has been created for you already and it can
    be found
    <a href="https://tuni-my.sharepoint.com/:u:/g/personal/mikko_ollila_tuni_fi/ERn8yGfrgL5OkpFLLNOe27kBvxopu0WYY5ipNecYFF3cug" >
    here</a>. You will need Oracle VirtualBox which can be downloaded from <a href="https://www.virtualbox.org/wiki/Downloads" >
    virtualbox.org</a> or from
    <a href="https://www.oracle.com/virtualization/technologies/vm/downloads/virtualbox-downloads.html?source=:ow:o:p:nav:mmddyyVirtualBoxHero&intcmp=:ow:o:p:nav:mmddyyVirtualBoxHero"
    >oracle.com</a>. (The username and password for the test virtual machine are both student.)
    </p>
    <p>
    To get started, you should check
    <a href="https://tuni-my.sharepoint.com/:b:/g/personal/mikko_ollila_tuni_fi/ESD5RDOjzB9OvOz89nC5rgABVt6281eb5Gtj5wWnht7ZSQ?e=1L3U6Q" >
    this document</a>. It was created to help primarily with exercise 4, but contains useful information to help
    with the other tasks too. In the first two tasks you mainly need to create a Kubernetes manifest file which
    described the deployment. See <a href="https://kubernetes.io/docs/concepts/overview/working-with-objects/" >this</a> for an example.
    Tasks 3 and 4 require you to also make a simple Node.js app along with the manifest file.
    </p>


K8s-plussa
==========

.. toctree::
  :maxdepth: 2

  programming_exercises/index
