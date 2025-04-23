document.addEventListener("DOMContentLoaded", async () => {
    const stripeKey = document.body.dataset.stripeKey;
    const stripe = Stripe(stripeKey);

    const elements = stripe.elements();
    const card = elements.create("card");
    card.mount("#card-element");

    const form = document.querySelector(".cc_form");

    form.addEventListener("submit", async (event) => {
        event.preventDefault();

        const { token, error } = await stripe.createToken(card);

        if (error) {
            const errorElement = document.getElementById("card-errors");
            errorElement.textContent = error.message;
        } else {
            const hiddenInput = document.createElement("input");
            hiddenInput.setAttribute("type", "hidden");
            hiddenInput.setAttribute("name", "payment[token]");
            hiddenInput.setAttribute("value", token.id);
            form.appendChild(hiddenInput);
            form.submit();
        }
    });
});

