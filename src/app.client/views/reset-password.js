'use strict';

module.exports = function(ctrl)  {return {tag: "form", attrs: {id:"reset-form", action:"/api/reset", method:"POST"}, children: [
  {tag: "input", attrs: {type:"hidden", name:"token", value: ctrl.token}}, 

  {tag: "fieldset", attrs: {class: error ? 'form-group has-danger' : 'form-group'}, children: [
    {tag: "label", attrs: {for:"reset-email"}, children: ["Email"]}, 
    {tag: "input", attrs: {type:"email", class:"form-control", id:"reset-email", name:"email", placeholder:"Email", 
           value:"{{email}}", readonly:"readonly"}}
  ]}, 

  {tag: "fieldset", attrs: {class:"form-group"}, children: [
    {tag: "label", attrs: {for:"reset-password"}, children: ["Password"]}, 
    {tag: "input", attrs: {type:"password", class:"form-control", id:"reset-password", name:"password", placeholder:"Password"}}
  ]}, 

  {tag: "fieldset", attrs: {class:"form-group"}, children: [
    {tag: "label", attrs: {for:"reset-password-confirm"}, children: ["Password"]}, 
    {tag: "input", attrs: {type:"password", class:"form-control", id:"reset-password-confirm", 
           name:"confirm_password", placeholder:"Password"}}
  ]}, 

  {tag: "button", attrs: {type:"submit", id:"reset-btn", class:"btn btn-primary"}, children: ["Save"]}
]};};
