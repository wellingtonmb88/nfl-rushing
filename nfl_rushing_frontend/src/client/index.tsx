import { ApolloClient,InMemoryCache } from 'apollo-boost';
import { createHttpLink } from 'apollo-link-http'; 
// import { InMemoryCache } from 'apollo-cache-inmemory';

// import { gql } from "apollo-boost";
 

const httpLink = createHttpLink({
  uri: 'http://localhost:4000/api/graphql',
  credentials: 'same-origin',
});

export const client = new ApolloClient({
  link: httpLink,
  cache: new InMemoryCache()
});


// client
//   .query({
//     query: gql`
//       {
//         rates(currency: "USD") {
//           currency
//         }
//       }
//     `
//   })
//   .then(result => console.log(result));