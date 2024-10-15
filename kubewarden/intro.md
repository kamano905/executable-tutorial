**Policy**


Before, during, and after deploying infrastructure or web applications, it's essential to ensure that the system meets security, cost, and compliance standards. Policies are the rules, criteria, and conditions established to maintain these compliance standards. 

**Policy as code (PaC)**


To eliminate the need for manual intervention and maintain consistency across environments (e.g., development, staging, and production), these policies can be defined as code, this approach is known as Policy as Code. Due to PaC, Polices can be tested like software and it also enables version-control. 

**Kubewarden**


Kubewarden is a Kubernetes Policy Engine. Using Kubewarden, you can write and run your own policies or can reuse policies from other policy engines. Policies can be written in programming languages like Rust, Go, Rego... which can be compiled in WebAssembly (Wasm) binaries.  

**The outline of this tutorial**
1. Setting up the environment.
2. Creating a Kubernetes cluster using Minikube (To demonstrate and test policy within a Kubernetes cluster).
3. Demonstrating two examples of applying policies within the Kubernetes cluster.

**Intended Learning Outcomes**
- Learn what is PaC and Kubewarden.
- Learn to write your own policies in Rego and compile into WebAssembly binaries.
- Learn how to distribute and deploy policies to a Kubernetes cluster.
