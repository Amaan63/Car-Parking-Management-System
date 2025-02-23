/**
 * 
 */
const formContainer = document.getElementById("formContainer");
const loginToggle = document.getElementById("loginToggle");
const registerToggle = document.getElementById("registerToggle");

loginToggle.addEventListener("click", () => {
	formContainer.style.transform = "translateX(0)";
	loginToggle.classList.add("active");
	registerToggle.classList.remove("active");
});

registerToggle.addEventListener("click", () => {
	formContainer.style.transform = "translateX(-50%)";
	registerToggle.classList.add("active");
	loginToggle.classList.remove("active");
});