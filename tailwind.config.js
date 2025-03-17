module.exports = {
    content: [
        "./app/views/**/*.erb", // ✅ Ensures Tailwind applies to Rails views
        "./app/helpers/**/*.rb",
        "./app/javascript/**/*.js",
        "./app/assets/stylesheets/**/*.css"
    ],
    theme: {
        extend: {},
    },
    plugins: [],
};
