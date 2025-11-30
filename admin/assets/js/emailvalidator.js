const email = document.getElementById('email');
const emailError = document.getElementById('email-error');

email.addEventListener('keyup', async (e) => {
    const response = await fetch('submit.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ email: email.value })
    });
    const data = await response.text();

    if (data) {
        emailError.textContent = data;
        emailError.style.color = 'red';
    } else {
        emailError.textContent = '';
    }
});
