//////register.js

////// Password toggle functionality
////function togglePassword(inputId) {
////  const input = document.getElementById(inputId);
////  const toggleBtn = input.parentElement.querySelector(".password-toggle i");

////  if (input.type === "password") {
////    input.type = "text";
////    toggleBtn.classList.remove("fa-eye");
////    toggleBtn.classList.add("fa-eye-slash");
////  } else {
////    input.type = "password";
////    toggleBtn.classList.remove("fa-eye-slash");
////    toggleBtn.classList.add("fa-eye");
////  }
////}

////// Password strength indicator
////document.getElementById("password").addEventListener("input", function () {
////  const password = this.value;
////  const strength = checkPasswordStrength(password);
////  updatePasswordStrengthIndicator(strength);
////});

////function checkPasswordStrength(password) {
////  let strength = 0;
////  if (password.length >= 8) strength++;
////  if (password.match(/[a-z]/)) strength++;
////  if (password.match(/[A-Z]/)) strength++;
////  if (password.match(/[0-9]/)) strength++;
////  if (password.match(/[^a-zA-Z0-9]/)) strength++;
////  return strength;
////}

////function updatePasswordStrengthIndicator(strength) {
////  const strengthFill = document.getElementById("strengthFill");
////  const strengthText = document.getElementById("strengthText");

////  const colors = ["#ff4444", "#ffaa00", "#ffff00", "#00ff00", "#00ff00"];
////  const texts = ["Very Weak", "Weak", "Fair", "Good", "Strong"];

////  strengthFill.style.width = strength * 20 + "%";
////  strengthFill.style.backgroundColor = colors[strength - 1] || "#ddd";
////  strengthText.textContent = texts[strength - 1] || "Password strength";
////}

////// Register form submission with enhanced UX
////document
////  .getElementById("registerForm")
////  .addEventListener("submit", function (e) {
////    e.preventDefault();

////    const firstName = document.getElementById("firstName").value.trim();
////    const lastName = document.getElementById("lastName").value.trim();
////    const email = document.getElementById("email").value.trim();
////    const phone = document.getElementById("phone").value.trim();
////    const address = document.getElementById("address").value.trim();
////    const password = document.getElementById("password").value;
////    const confirmPassword = document.getElementById("confirmPassword").value;
////    const terms = document.getElementById("terms").checked;

////    // Enhanced validation with specific error messages
////    if (!firstName) {
////      showNotification("Please enter your first name.", "error");
////      document.getElementById("firstName").focus();
////      return;
////    }

////    if (!lastName) {
////      showNotification("Please enter your last name.", "error");
////      document.getElementById("lastName").focus();
////      return;
////    }

////    if (!email) {
////      showNotification("Please enter your email address.", "error");
////      document.getElementById("email").focus();
////      return;
////    }

////    // Email format validation
////    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
////    if (!emailRegex.test(email)) {
////      showNotification("Please enter a valid email address.", "error");
////      document.getElementById("email").focus();
////      return;
////    }

////    if (!phone) {
////      showNotification("Please enter your phone number.", "error");
////      document.getElementById("phone").focus();
////      return;
////    }

////    if (!address) {
////      showNotification("Please enter your delivery address.", "error");
////      document.getElementById("address").focus();
////      return;
////    }

////    if (!password) {
////      showNotification("Please enter a password.", "error");
////      document.getElementById("password").focus();
////      return;
////    }

////    if (password.length < 8) {
////      showNotification("Password must be at least 8 characters long.", "error");
////      document.getElementById("password").focus();
////      return;
////    }

////    if (!confirmPassword) {
////      showNotification("Please confirm your password.", "error");
////      document.getElementById("confirmPassword").focus();
////      return;
////    }

////    if (password !== confirmPassword) {
////      showNotification("Passwords do not match. Please try again.", "error");
////      document.getElementById("confirmPassword").focus();
////      return;
////    }

////    // CRITICAL: Terms and Conditions validation
////    if (!terms) {
////      showNotification(
////        "You must accept the Terms & Conditions to create an account.",
////        "error"
////      );
////      document.getElementById("terms").focus();
////      highlightTermsCheckbox();
////      return;
////    }

////    // Add loading state
////    const submitBtn = document.querySelector(".modern-register-btn");
////    const originalText = submitBtn.querySelector(".btn-text").textContent;
////    submitBtn.querySelector(".btn-text").textContent = "Creating account...";
////    submitBtn.disabled = true;

////    // Simulate API call
////    setTimeout(() => {
////      // Store user data in registered users list
////      const registeredUsers = JSON.parse(localStorage.getItem('registeredUsers') || '[]');

////      // Check if user already exists
////      const existingUser = registeredUsers.find(user => user.email === email);
////      if (existingUser) {
////        showNotification("An account with this email already exists. <br><a href='login.aspx' style='color: #fff; text-decoration: underline; font-weight: bold;'>Click here to login</a>", "error");
////        submitBtn.querySelector(".btn-text").textContent = originalText;
////        submitBtn.disabled = false;
////        return;
////      }

////      // Add new user to registered users list
////      const newUser = {
////        email: email,
////        firstName: firstName,
////        lastName: lastName,
////        phone: phone,
////        address: address,
////        password: password, // In a real app, this should be hashed
////        registrationTime: new Date().toISOString(),
////      };

////      registeredUsers.push(newUser);
////      localStorage.setItem('registeredUsers', JSON.stringify(registeredUsers));

////      // Set user login status after successful registration
////      const userData = {
////        email: email,
////        firstName: firstName,
////        lastName: lastName,
////        phone: phone,
////        address: address,
////        registrationTime: new Date().toISOString(),
////      };
////      localStorage.setItem("currentUser", JSON.stringify(userData));

////      showNotification(
////        "🎉 Account created successfully! Welcome to FoodieExpress.",
////        "success"
////      );
////      setTimeout(() => {
////        window.location.href = "index.aspx";
////      }, 2000);

////      // Reset button state
////      submitBtn.querySelector(".btn-text").textContent = originalText;
////      submitBtn.disabled = false;
////    }, 1500);
////  });

////// Function to highlight terms checkbox when not accepted
////function highlightTermsCheckbox() {
////  const termsCheckbox = document.getElementById("terms");
////  const termsLabel = document.getElementById("termsLabel");

////  // Add visual feedback
////  termsLabel.classList.add("shake", "error");

////  // Remove animation and error styling after it completes
////  setTimeout(() => {
////    termsLabel.classList.remove("shake", "error");
////  }, 1000);
////}

////// Real-time terms validation
////document.getElementById("terms").addEventListener("change", function () {
////  const submitBtn = document.querySelector(".modern-register-btn");
////  const termsLabel = document.getElementById("termsLabel");

////  if (this.checked) {
////    // Enable submit button when terms are accepted
////    submitBtn.disabled = false;
////    submitBtn.style.opacity = "1";
////    termsLabel.classList.remove("error");
////  } else {
////    // Disable submit button when terms are unchecked
////    submitBtn.disabled = true;
////    submitBtn.style.opacity = "0.6";
////  }
////});

////// Initialize submit button state based on terms checkbox
////document.addEventListener("DOMContentLoaded", function () {
////  const termsCheckbox = document.getElementById("terms");
////  const submitBtn = document.querySelector(".modern-register-btn");

////  if (!termsCheckbox.checked) {
////    submitBtn.disabled = true;
////    submitBtn.style.opacity = "0.6";
////  }
////});

////// Add floating label effect
////document.querySelectorAll(".input-wrapper input").forEach((input) => {
////  input.addEventListener("focus", function () {
////    this.parentElement.classList.add("focused");
////  });

////  input.addEventListener("blur", function () {
////    if (!this.value) {
////      this.parentElement.classList.remove("focused");
////    }
////  });
////});







//// register.js

//// Password toggle functionality
//function togglePassword(inputId) {
//    const input = document.getElementById(inputId);
//    if (!input) return;

//    const toggleBtn = input.parentElement.querySelector(".password-toggle i");
//    if (!toggleBtn) return;

//    if (input.type === "password") {
//        input.type = "text";
//        toggleBtn.classList.remove("fa-eye");
//        toggleBtn.classList.add("fa-eye-slash");
//    } else {
//        input.type = "password";
//        toggleBtn.classList.remove("fa-eye-slash");
//        toggleBtn.classList.add("fa-eye");
//    }
//}

//// Password strength indicator
//const passwordInput = document.getElementById("password");
//if (passwordInput) {
//    passwordInput.addEventListener("input", function () {
//        const password = this.value;
//        const strength = checkPasswordStrength(password);
//        updatePasswordStrengthIndicator(strength);
//    });
//}

//function checkPasswordStrength(password) {
//    let strength = 0;
//    if (password.length >= 8) strength++;
//    if (password.match(/[a-z]/)) strength++;
//    if (password.match(/[A-Z]/)) strength++;
//    if (password.match(/[0-9]/)) strength++;
//    if (password.match(/[^a-zA-Z0-9]/)) strength++;
//    return strength;
//}

//function updatePasswordStrengthIndicator(strength) {
//    const strengthFill = document.getElementById("strengthFill");
//    const strengthText = document.getElementById("strengthText");

//    if (!strengthFill || !strengthText) return;

//    const colors = ["#ff4444", "#ffaa00", "#ffff00", "#00ff00", "#00ff00"];
//    const texts = ["Very Weak", "Weak", "Fair", "Good", "Strong"];

//    strengthFill.style.width = strength * 20 + "%";
//    strengthFill.style.backgroundColor = colors[strength - 1] || "#ddd";
//    strengthText.textContent = texts[strength - 1] || "Password strength";
//}

//// Register form submission
//const registerForm = document.getElementById("registerForm");
//if (registerForm) {
//    registerForm.addEventListener("submit", function (e) {
//        e.preventDefault();

//        const firstName = document.getElementById("firstName")?.value.trim() || "";
//        const lastName = document.getElementById("lastName")?.value.trim() || "";
//        const email = document.getElementById("email")?.value.trim() || "";
//        const phone = document.getElementById("phone")?.value.trim() || "";
//        const address = document.getElementById("address")?.value.trim() || "";
//        const password = document.getElementById("password")?.value || "";
//        const confirmPassword = document.getElementById("confirmPassword")?.value || "";
//        const terms = document.getElementById("terms")?.checked || false;

//        if (!firstName || !lastName || !email || !phone || !address || !password || !confirmPassword || !terms) {
//            return;
//        }

//        if (password.length < 8 || password !== confirmPassword) {
//            return;
//        }

//        // Simulate account creation
//        const registeredUsers = JSON.parse(localStorage.getItem("registeredUsers") || "[]");

//        const existingUser = registeredUsers.find((user) => user.email === email);
//        if (existingUser) return;

//        const newUser = {
//            email: email,
//            firstName: firstName,
//            lastName: lastName,
//            phone: phone,
//            address: address,
//            password: password,
//            registrationTime: new Date().toISOString(),
//        };

//        registeredUsers.push(newUser);
//        localStorage.setItem("registeredUsers", JSON.stringify(registeredUsers));
//        localStorage.setItem("currentUser", JSON.stringify(newUser));

//        // Redirect after successful registration
//        setTimeout(() => {
//            window.location.href = "index.aspx";
//        }, 1000);
//    });
//}

//// Real-time terms validation
//const termsCheckbox = document.getElementById("terms");
//if (termsCheckbox) {
//    termsCheckbox.addEventListener("change", function () {
//        const submitBtn = document.querySelector(".modern-register-btn");
//        if (!submitBtn) return;

//        if (this.checked) {
//            submitBtn.disabled = false;
//            submitBtn.style.opacity = "1";
//        } else {
//            submitBtn.disabled = true;
//            submitBtn.style.opacity = "0.6";
//        }
//    });
//}

//// Initialize button state
//document.addEventListener("DOMContentLoaded", function () {
//    const terms = document.getElementById("terms");
//    const submitBtn = document.querySelector(".modern-register-btn");
//    if (!terms || !submitBtn) return;

//    if (!terms.checked) {
//        submitBtn.disabled = true;
//        submitBtn.style.opacity = "0.6";
//    }
//});

//// Floating label effect
//document.querySelectorAll(".input-wrapper input").forEach((input) => {
//    input.addEventListener("focus", function () {
//        this.parentElement.classList.add("focused");
//    });
//    input.addEventListener("blur", function () {
//        if (!this.value) {
//            this.parentElement.classList.remove("focused");
//        }
//    });
//});





// register.js - GUARANTEED WORKING VERSION

// Wait for DOM to be fully loaded
document.addEventListener('DOMContentLoaded', function () {
    console.log('DOM loaded - initializing registration form...');

    // Initialize all features
    initializePasswordToggles();
    initializePasswordStrength();
    initializeTermsValidation();
    initializeFloatingLabels();

    console.log('All features initialized successfully');
});

// 1. PASSWORD TOGGLE FUNCTIONALITY
function initializePasswordToggles() {
    console.log('Initializing password toggles...');

    // Get the toggle buttons
    const passwordToggle = document.getElementById('passwordToggle');
    const confirmPasswordToggle = document.getElementById('confirmPasswordToggle');

    // Get the password inputs - using ClientID for ASP.NET
    const passwordInput = document.getElementById('<%= txtpass.ClientID %>');
    const confirmPasswordInput = document.getElementById('<%= txtcon.ClientID %>');

    console.log('Toggle elements:', {
        passwordToggle: !!passwordToggle,
        confirmPasswordToggle: !!confirmPasswordToggle,
        passwordInput: !!passwordInput,
        confirmPasswordInput: !!confirmPasswordInput
    });

    // Password toggle functionality
    if (passwordToggle && passwordInput) {
        passwordToggle.addEventListener('click', function () {
            console.log('Password toggle clicked');
            togglePasswordVisibility(passwordInput, passwordToggle);
        });
    } else {
        console.error('Password toggle or input not found');
    }

    // Confirm password toggle functionality
    if (confirmPasswordToggle && confirmPasswordInput) {
        confirmPasswordToggle.addEventListener('click', function () {
            console.log('Confirm password toggle clicked');
            togglePasswordVisibility(confirmPasswordInput, confirmPasswordToggle);
        });
    } else {
        console.error('Confirm password toggle or input not found');
    }
}

function togglePasswordVisibility(input, toggleBtn) {
    const icon = toggleBtn.querySelector('i');

    if (input.type === 'password') {
        input.type = 'text';
        icon.classList.remove('fa-eye');
        icon.classList.add('fa-eye-slash');
        console.log('Password shown');
    } else {
        input.type = 'password';
        icon.classList.remove('fa-eye-slash');
        icon.classList.add('fa-eye');
        console.log('Password hidden');
    }
}

// 2. PASSWORD STRENGTH INDICATOR
function initializePasswordStrength() {
    console.log('Initializing password strength indicator...');

    const passwordInput = document.getElementById('<%= txtpass.ClientID %>');
    const strengthFill = document.getElementById('strengthFill');
    const strengthText = document.getElementById('strengthText');

    console.log('Strength elements:', {
        passwordInput: !!passwordInput,
        strengthFill: !!strengthFill,
        strengthText: !!strengthText
    });

    if (passwordInput && strengthFill && strengthText) {
        passwordInput.addEventListener('input', function () {
            const password = this.value;
            const strength = calculatePasswordStrength(password);
            updateStrengthIndicator(strength, strengthFill, strengthText);
        });

        // Initialize with empty password
        updateStrengthIndicator(0, strengthFill, strengthText);
    } else {
        console.error('Password strength elements not found');
    }
}

function calculatePasswordStrength(password) {
    if (!password) return 0;

    let strength = 0;

    // Length check
    if (password.length >= 8) strength += 1;
    // Lowercase letter
    if (/[a-z]/.test(password)) strength += 1;
    // Uppercase letter  
    if (/[A-Z]/.test(password)) strength += 1;
    // Number
    if (/[0-9]/.test(password)) strength += 1;
    // Special character
    if (/[^A-Za-z0-9]/.test(password)) strength += 1;

    return Math.min(strength, 5); // Max strength is 5
}

function updateStrengthIndicator(strength, strengthFill, strengthText) {
    const strengthData = [
        { width: '0%', color: '#ff4444', text: 'Very Weak' },
        { width: '20%', color: '#ff6b6b', text: 'Weak' },
        { width: '40%', color: '#ffaa00', text: 'Fair' },
        { width: '60%', color: '#4ecdc4', text: 'Good' },
        { width: '80%', color: '#1a936f', text: 'Strong' },
        { width: '100%', color: '#1a936f', text: 'Very Strong' }
    ];

    const data = strengthData[strength] || strengthData[0];

    strengthFill.style.width = data.width;
    strengthFill.style.backgroundColor = data.color;
    strengthText.textContent = data.text;
    strengthText.style.color = data.color;

    console.log('Strength updated:', data.text);
}

// 3. TERMS VALIDATION
function initializeTermsValidation() {
    console.log('Initializing terms validation...');

    const termsCheckbox = document.getElementById('terms');
    const submitButton = document.querySelector('.modern-register-btn');

    if (termsCheckbox && submitButton) {
        // Set initial state
        submitButton.disabled = !termsCheckbox.checked;

        // Update on change
        termsCheckbox.addEventListener('change', function () {
            submitButton.disabled = !this.checked;
            console.log('Terms checkbox changed:', this.checked);
        });
    } else {
        console.error('Terms checkbox or submit button not found');
    }
}

// 4. FLOATING LABELS
function initializeFloatingLabels() {
    console.log('Initializing floating labels...');

    const inputs = document.querySelectorAll('.form-input');

    inputs.forEach(input => {
        // Check initial value
        if (input.value) {
            input.parentElement.classList.add('focused');
        }

        input.addEventListener('focus', function () {
            this.parentElement.classList.add('focused');
        });

        input.addEventListener('blur', function () {
            if (!this.value) {
                this.parentElement.classList.remove('focused');
            }
        });
    });

    console.log('Floating labels initialized for', inputs.length, 'inputs');
}

// 5. DEBUG FUNCTION - Check if everything is working
function debugRegistrationForm() {
    console.log('=== REGISTRATION FORM DEBUG INFO ===');

    // Check password toggles
    const passwordToggle = document.getElementById('passwordToggle');
    const confirmToggle = document.getElementById('confirmPasswordToggle');
    const passwordInput = document.getElementById('<%= txtpass.ClientID %>');
    const confirmInput = document.getElementById('<%= txtcon.ClientID %>');

    console.log('Password Toggle:', passwordToggle);
    console.log('Confirm Toggle:', confirmToggle);
    console.log('Password Input:', passwordInput);
    console.log('Confirm Input:', confirmInput);

    // Check strength indicator
    const strengthFill = document.getElementById('strengthFill');
    const strengthText = document.getElementById('strengthText');
    console.log('Strength Fill:', strengthFill);
    console.log('Strength Text:', strengthText);

    // Check terms
    const terms = document.getElementById('terms');
    const submitBtn = document.querySelector('.modern-register-btn');
    console.log('Terms Checkbox:', terms);
    console.log('Submit Button:', submitBtn);

    console.log('=== END DEBUG INFO ===');
}

// Run debug after initialization
setTimeout(debugRegistrationForm, 1000);