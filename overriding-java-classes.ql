/**
 * @name Overriding Java HttpServlet Classes
 * @description Identifying if a developer is overriding methods in HttpServlet.
 * @kind problem
 * @problem.severity warning
 * @precision medium
 * @id java/overriding-httpservlet
 * @tags maintainability
 *       readability
 */

import java

private class HttpServletClass extends Class {
  HttpServletClass() { this.getAnAncestor().hasQualifiedName("javax.servlet.http", "HttpServlet") }
}

class OverrideAnntation extends Annotation {
  OverrideAnntation() { this.getType().hasQualifiedName(_, "Override") }
}

// class HttpServletMethod extends Method {
//   HttpServletMethod() {
//     this.getDeclaringType() instanceof HttpServletClass and
//     this.getName() in ["doGet", "doPost"]
//   }
// }
from Method method, OverrideAnntation annot
where
  method.getDeclaringType() instanceof HttpServletClass and
  method.getName() in ["doGet", "doPost"] and
  // method.overrides(method) and
  method.hasAnnotation() and
  method.getAnAnnotation() = annot
select method, "The HttpServlet method is overridden."
