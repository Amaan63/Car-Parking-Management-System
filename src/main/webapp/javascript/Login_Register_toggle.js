document.addEventListener("DOMContentLoaded", () => {
  // Select both form wrappers (login and register)
  const formWrappers = document.querySelectorAll(".form-wrapper");
  // Get the toggle buttons for switching between forms
  const loginToggle = document.getElementById("loginToggle");
  const registerToggle = document.getElementById("registerToggle");

  // Set login form as active by default when the page loads
  formWrappers[0].classList.add("active");
  loginToggle.classList.add("active");

  // Event listener for Login button
  loginToggle.addEventListener("click", () => {
    // Show the login form and hide the register form
    formWrappers[0].classList.add("active");
    formWrappers[1].classList.remove("active");

    // Update button states (highlight the active button)
    loginToggle.classList.add("active");
    registerToggle.classList.remove("active");
  });

  // Event listener for Register button
  registerToggle.addEventListener("click", () => {
    // Show the register form and hide the login form
    formWrappers[1].classList.add("active");
    formWrappers[0].classList.remove("active");

    // Update button states (highlight the active button)
    registerToggle.classList.add("active");
    loginToggle.classList.remove("active");
  });
});

