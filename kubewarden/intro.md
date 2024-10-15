
<br>

### Welcome !

**Policy as code (PaC)**
- When you set up the infrastructure required to run applications, whether manually or through code, it's essential to ensure that it adheres to security, cost-efficiency, and compliance standards.

- To eliminate the need for manual intervention and maintain consistency across environments (e.g., development, staging, and production), these policies can be defined as code, this approach is known as Policy as Code.

**What is Kubewarden?**

Kubewarden is a Kubernetes Policy Engine. With Kubewarden, you can author policies using languages such as Rust, Go, and Rego that compile into WebAssembly binaries. WebAssembly enhances the portability of applications and facilitates integration with external CI/CD tools.

**The outline of this tutorial**
1. Setting up the environment.
2. Creating a Kubernetes cluster using Minikube.
3. Demonstrating two examples of applying policies within the Kubernetes cluster.

**Intended Learning Outcomes**
- Learn the basic principles of Kubewarden.
- Learn to write and compile your own policies in Rego into WebAssembly binaries.
- Learn how to distribute and deploy policies to a Kubernetes cluster.
