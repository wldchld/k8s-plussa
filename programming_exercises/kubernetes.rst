Kubernetes
==========

This chapter includes the Kubernetes exercises. Please note, that the **grading
takes 3-5 minutes** and the submission window will **not** automatically show
you the result when grading take more than a minute. You need to **manually** open
it from the **"My submissions"** menu.

You should have a basic understanding about Kubernetes before doing the actual exercises
on this page. `Kubernetes.io <https://kubernetes.io/docs/concepts/>`_ has very detailed
documentation and a `tutorial <https://kubernetes.io/docs/tutorials/kubernetes-basics/>`_
to guide you through the basic usage. The tutorial will use minikube and you can use the
provided virtual machine to complete it. (Please note, that when using minikube the kubectl
command has to be run like this: "minikube kubectl --" unless you add an alias for it.)

For a more compact package about the core concepts I suggest checking out
`this tutorial's <https://dev.to/leandronsp/kubernetes-101-part-i-the-fundamentals-23a1>`_ parts I-IV and VIII. Remaining
parts are a good read, but really relevant for the exercises here.

To get started with the actual exercises, reading
`this tutorial <https://www.mirantis.com/blog/introduction-to-yaml-creating-a-kubernetes-deployment/>`_
is a good starting point. `This <https://kubernetes.io/docs/tutorials/services/connect-applications-service/>`_
should also help you out.

The NGINX (pronounced engine X) used in the exercises is a web server used to
serve static web pages as well as for many other things. Deep knowledge about
it is not required, but if you wish to learn more, you can check its
`website. <https://nginx.org/en/>`_

In the second exercise you need to use
`persistent volumes <https://kubernetes.io/docs/concepts/storage/persistent-volumes/>`_.

In exercises 3 and 4 you must create a simple Node.js app and if you have not
used it before, you can check out the `W3 schools tutorial <https://www.w3schools.com/nodejs/default.asp>`_.
Your app will be uploaded to a local image registry. Check `this <https://distribution.github.io/distribution/>`_
out if you wish to learn more about the registry.

`This <https://tuni-my.sharepoint.com/:b:/g/personal/mikko_ollila_tuni_fi/ESD5RDOjzB9OvOz89nC5rgABVt6281eb5Gtj5wWnht7ZSQ?e=1L3U6Q>`_
was also created to help you with exercises 3 and 4.

.. submit:: k8s_ex1 10
  :config: exercises/k8s/config_ex1.yaml

.. submit:: k8s_ex2 10
  :config: exercises/k8s/config_ex2.yaml

.. submit:: k8s_ex3 10
  :config: exercises/k8s/config_ex3.yaml

.. submit:: k8s_ex4 15
  :config: exercises/k8s/config_ex4.yaml
