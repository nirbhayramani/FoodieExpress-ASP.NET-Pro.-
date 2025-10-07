//// login.js

//// Password toggle functionality
//function togglePassword(inputId) {
//  const input = document.getElementById(inputId);
//  const toggleBtn = input.parentElement.querySelector(".password-toggle i");

//  if (input.type === "password") {
//    input.type = "text";
//    toggleBtn.classList.remove("fa-eye");
//    toggleBtn.classList.add("fa-eye-slash");
//  } else {
//    input.type = "password";
//    toggleBtn.classList.remove("fa-eye-slash");
//    toggleBtn.classList.add("fa-eye");
//  }
//}

//// Login form submission with enhanced UX
//document.getElementById("loginForm").addEventListener("submit", function (e) {
//  e.preventDefault();

//  const email = document.getElementById("email").value;
//  const password = document.getElementById("password").value;
//  const remember = document.getElementById("remember").checked;

//  // Add loading state
//  const submitBtn = document.querySelector(".modern-login-btn");
//  const originalText = submitBtn.querySelector(".btn-text").textContent;
//  submitBtn.querySelector(".btn-text").textContent = "Signing in...";
//  submitBtn.disabled = true;

//  // Simulate API call
//  setTimeout(() => {
//    if (email && password) {
//      // Email format validation
//      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
//      if (!emailRegex.test(email)) {
//        showNotification("Please enter a valid email address.", "error");
//        submitBtn.querySelector(".btn-text").textContent = originalText;
//        submitBtn.disabled = false;
//        return;
//      }

//      // Check if user is registered
//      const registeredUsers = JSON.parse(localStorage.getItem('registeredUsers') || '[]');
//      const user = registeredUsers.find(user => user.email === email);

//      if (!user) {
//        showNotification("Account not found. Please register first to create an account.<br><a href='register.aspx' style='color: #fff; text-decoration: underline; font-weight: bold;'>Click here to register</a>", "error");
//        submitBtn.querySelector(".btn-text").textContent = originalText;
//        submitBtn.disabled = false;
//        return;
//      }

//      // Check if password matches
//      if (user.password !== password) {
//        showNotification("Incorrect password. Please try again.", "error");
//        submitBtn.querySelector(".btn-text").textContent = originalText;
//        submitBtn.disabled = false;
//        return;
//      }

//      // Set user login status
//      const userData = {
//        email: user.email,
//        firstName: user.firstName,
//        lastName: user.lastName,
//        phone: user.phone,
//        address: user.address,
//        loginTime: new Date().toISOString(),
//      };
//      localStorage.setItem("currentUser", JSON.stringify(userData));

//      showNotification(
//        "🎉 Login successful! Welcome back to FoodieExpress.",
//        "success"
//      );
//      setTimeout(() => {
//        window.location.href = "index.aspx";
//      }, 2000);
//    } else {
//      showNotification("Please fill in all required fields.", "error");
//    }

//    // Reset button state
//    submitBtn.querySelector(".btn-text").textContent = originalText;
//    submitBtn.disabled = false;
//  }, 1500);
//});

//// Add floating label effect
//document.querySelectorAll(".input-wrapper input").forEach((input) => {
//  input.addEventListener("focus", function () {
//    this.parentElement.classList.add("focused");
//  });

//  input.addEventListener("blur", function () {
//    if (!this.value) {
//      this.parentElement.classList.remove("focused");
//    }
//  });
//});




// login.js (robust version)

// Password toggle functionality
function togglePassword(inputId) {
    const input = document.getElementById(inputId);
    if (!input) return; // safe guard

    const toggleBtn = input.parentElement?.querySelector(".password-toggle i");
    if (!toggleBtn) return;

    if (input.type === "password") {
        input.type = "text";
        toggleBtn.classList.remove("fa-eye");
        toggleBtn.classList.add("fa-eye-slash");
    } else {
        input.type = "password";
        toggleBtn.classList.remove("fa-eye-slash");
        toggleBtn.classList.add("fa-eye");
    }
}

// Run when DOM is ready
document.addEventListener("DOMContentLoaded", () => {
    // Get form (guarded)
    const loginForm = document.getElementById("loginForm");
    if (loginForm) {
        loginForm.addEventListener("submit", function (e) {
            e.preventDefault();

            const emailEl = document.getElementById("email");
            const passwordEl = document.getElementById("password");
            const rememberEl = document.getElementById("remember");

            const email = emailEl?.value || "";
            const password = passwordEl?.value || "";
            const remember = !!(rememberEl?.checked);

            // Add loading state (guard the button elements)
            const submitBtn = document.querySelector(".modern-login-btn");
            const btnTextEl = submitBtn?.querySelector(".btn-text");
            const originalText = btnTextEl?.textContent || "Sign in";

            if (btnTextEl) btnTextEl.textContent = "Signing in...";
            if (submitBtn) submitBtn.disabled = true;

            // Simulate API call
            setTimeout(() => {
                if (email && password) {
                    // Email format validation
                    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                    if (!emailRegex.test(email)) {
                        showNotification("Please enter a valid email address.", "error");
                        if (btnTextEl) btnTextEl.textContent = originalText;
                        if (submitBtn) submitBtn.disabled = false;
                        return;
                    }

                    // Check if user is registered
                    const registeredUsers = JSON.parse(localStorage.getItem("registeredUsers") || "[]");
                    const user = registeredUsers.find((u) => u.email === email);

                    if (!user) {
                        showNotification(
                            "Account not found. Please register first to create an account.<br><a href='register.aspx' style='color: #fff; text-decoration: underline; font-weight: bold;'>Click here to register</a>",
                            "error"
                        );
                        if (btnTextEl) btnTextEl.textContent = originalText;
                        if (submitBtn) submitBtn.disabled = false;
                        return;
                    }

                    // Check if password matches
                    if (user.password !== password) {
                        showNotification("Incorrect password. Please try again.", "error");
                        if (btnTextEl) btnTextEl.textContent = originalText;
                        if (submitBtn) submitBtn.disabled = false;
                        return;
                    }

                    // Set user login status
                    const userData = {
                        email: user.email,
                        firstName: user.firstName,
                        lastName: user.lastName,
                        phone: user.phone,
                        address: user.address,
                        loginTime: new Date().toISOString(),
                    };
                    localStorage.setItem("currentUser", JSON.stringify(userData));

                    showNotification("🎉 Login successful! Welcome back to FoodieExpress.", "success");
                    setTimeout(() => {
                        window.location.href = "index.aspx";
                    }, 1200);
                } else {
                    showNotification("Please fill in all required fields.", "error");
                }

                // Reset button state
                if (btnTextEl) btnTextEl.textContent = originalText;
                if (submitBtn) submitBtn.disabled = false;
            }, 1500);
        };
    } // end if loginForm

    // Add floating label effect (safe even if there are 0 inputs)
    document.querySelectorAll(".input-wrapper input").forEach((input) => {
        input.addEventListener("focus", function () {
            this.parentElement.classList.add("focused");
        });

        input.addEventListener("blur", function () {
            if (!this.value) {
                this.parentElement.classList.remove("focused");
            }
        });
    });
});

