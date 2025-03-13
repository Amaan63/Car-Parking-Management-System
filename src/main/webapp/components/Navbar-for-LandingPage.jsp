<style>
    @media (min-width: 768px) { /* Apply styles for tablets and larger screens */
        .navbar-brand i {
            font-size: 1.5rem; /* Bigger icon */
        }
        .navbar-brand span {
            font-size: 1.25rem; /* Bigger text */
        }
        .btn-custom {
            font-size: 1rem; /* Increase button text size */
            padding: 6px 12px; /* More padding */
        }
    }
</style>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
    <div class="container-fluid d-flex flex-nowrap justify-content-between align-items-center">
        <!-- Brand Logo and Name -->
        <a class="navbar-brand d-flex align-items-center flex-shrink-0" href="#"> 
            <i class="fas fa-parking text-success" style="font-size: 1.2rem;"></i> 
            <span class="fs-6 fw-bold ms-1">ParkEase</span>
        </a>

        <!-- Sign In Buttons -->
        <div class="d-flex gap-1 flex-shrink-0">
            <a class="btn btn-outline-light btn-sm btn-custom text-nowrap" href="User-Registration&Login.jsp">User</a>
            <a class="btn btn-outline-light btn-sm btn-custom text-nowrap" href="Admin-Login.jsp">Admin</a>
        </div>
    </div>
</nav>
