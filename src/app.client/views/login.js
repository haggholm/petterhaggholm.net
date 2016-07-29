'use strict';

module.exports = function(ctrl)  {return {tag: "form", attrs: {id:"login-form", action:"/api/login", method:"POST"}, children: [
  {tag: "fieldset", attrs: {class: ctrl.error ? 'form-group has-danger' : 'form-group'}, children: [
    {tag: "label", attrs: {for:"login-email"}, children: ["Email"]}, 
    {tag: "input", attrs: {type:"email", class:"form-control", id:"login-email", name:"email", placeholder:"Email"}}
  ]}, 

  {tag: "fieldset", attrs: {class: ctrl.error ? 'form-group has-danger' : 'form-group'}, children: [
    {tag: "label", attrs: {for:"login-password"}, children: ["Password"]}, 
    {tag: "input", attrs: {type:"password", class:"form-control", id:"login-password", name:"password", placeholder:"Password"}}
  ]}, 

  {tag: "button", attrs: {type:"submit", id:"login-btn", class:"btn btn-primary"}, children: ["Sign in"]}, 
  {tag: "button", attrs: {type:"submit", value:"forgot", id:"login-forgot", class:"btn btn-default"}, children: ["Forgot password"]}
]};};
