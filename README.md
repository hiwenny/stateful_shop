# stateful_shop

Sample demo showing various methods to use Providers in Flutter.
Search for keywords e.g. `2. Sample nested Provider` to see where they're implemented.
## Examples Directory
- 1. Sample Provider: \<Products> in `/main.dart` for products list changes
- 2. Sample nested Provider: \<Product>provider, for product details listener. This is a sample of nested provider.
- 3. Opt-out listener: to subscribe and get the init state, but ignore subsequent updates.
- 4. Sample Provider with rebuild on value change. Aside from its brevity (no passing on unused context), it also specifies the instruction to rebuild on value change instead of merely recycling the Widget as per the `builder` method.

## Important Notes
- Nested providers can cause bugs - because Flutter recycles Widgets and doesn't rebuild on every navigation, nested Providers may have stale data. This happens on virtualised lists that don't get rendered when they are off-screen.
- The solution is to tie the Provider to the data (value) using `ChangeNotifierProvider.value(value: products[i])` instead of the builder method way, that attaches it to the Widget build context changes.
- Guideline: when Providing for a new instance of an object, use ChangeNotifierProvider.builder for efficiency. Example: `<Products>`
- When Providing to reuse with existing object, use ChangeNotifierProvider.value constructor. Example: `<Product>`