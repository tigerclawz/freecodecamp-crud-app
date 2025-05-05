package json file cannot have comments for risk compilation error so having it in the 
readme.md file for future reference

// frontend/package.json
{
  "name": "crud-frontend", // Name of the frontend project
  "version": "1.0.0", // Version for tracking changes
  "scripts": {
    "start": "react-scripts start", // Runs the dev server
    "build": "react-scripts build", // Builds for production
    "test": "react-scripts test", // Runs tests (placeholder for Jest)
    "lint": "eslint ." // Checks code style with ESLint
  },
  "dependencies": {
    "react": "^17.0.2", // Core React library
    "react-dom": "^17.0.2", // Renders React to the DOM
    "react-scripts": "^4.0.3", // Scripts for React development
    "axios": "^0.24.0" // HTTP client for API calls
  },
  "devDependencies": {
    "eslint": "^8.0.0" // Linting tool for code quality
  }
}