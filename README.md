# stateful_shop

Sample demo showing various methods to use Providers in Flutter.
Search for keywords e.g. `2. Sample nested Provider` to see where they're implemented.
## Examples Directory
- 1. Sample Provider: \<Products> in `/main.dart` for products list changes
- 2. Sample nested Provider: \<Product>provider, for product details listener. This is a sample of nested provider.
- 3. Opt-out listener: to subscribe and get the init state, but ignore subsequent updates.

## Warnings
- Nested providers can cause bugs - because Flutter recycles Widgets and doesn't rebuild on every navigation, nested Providers may have stale data.
