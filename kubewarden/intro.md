
<br>

### Welcome !

<!-- **What is a Policy?**
- When you set up the infrastructure required to run applications, whether manually or through code, it's essential to ensure that it adheres to security, cost-efficiency, and compliance standards. -->

<!-- - For example, when deploying web applications on the cloud, you need to ensure that all data stored in databases is encrypted and that all cloud resources are properly tagged for tracking and management. -->

<!-- - Once the application is live, you also need to make sure that critical resources are backed up daily and monitor for underutilized resources to avoid unnecessary expenses. -->

<!-- - All these rules, criteria, and conditions that guide how infrastructure should be configured and managed before, during, and after deployment are defined as policies. -->

**Policy as code (PaC)**
- When you set up the infrastructure required to run applications, whether manually or through code, it's essential to ensure that it adheres to security, cost-efficiency, and compliance standards.

- To eliminate the need for manual intervention and maintain consistency across environments (e.g., development, staging, and production), these policies can be defined as code, this approach is known as Policy as Code.

<!-- - Writing policies as code also allows for version control, making it possible to track and manage changes over time. -->

<!-- - Additionally, with Policy as Code, policies can be tested just like software, ensuring they function correctly before being applied to the environment. -->

**What is Kubewarden?**

Kubewarden is a Kubernetes Policy Engine. Using Kubewarden you can write your policies in any languages 
such as Rust, Go and Rego that generate WebAssembly binaries. Using WebAssembly enhances the portability of applications and enable to integrate with external CI/CD tools.

**The outline of this tutorial**
1. Environmental setup
2. Create kubernetes cluster using minikube.
3. Practice two examples of applying policies in the kubernetes cluster.

**Intended Learning Outcomes**
- You can understand the basic principles of Kubewarden.
- You can write your own policy in Rego and generate WebAssembly binaries.
- You can distribute a policy and deploy to kubernetes cluster.
