# debug_action
This action prints actions contexts for debugging

# Usage
```yaml
- uses: henrygriffiths/debug_action@main
  with:
    # Optional
    # Specify which contexts to print
    # Default: 'github,env,job,steps,runner,secrets,strategy,matrix,needs,inputs'
    contexts: ''
    
    # Optional
    # Provide secrets context to action, as secrets context is not available in composite workflows
    # Default: null
    secrets_context: ${{ toJson(secrets) }}
    
    # Optional
    # Provide needs context to action, as needs context is not available in composite workflows
    # Default: null
    needs_context: ${{ toJson(needs) }}
````

# Example for single context
```yaml
- uses: henrygriffiths/debug_action@main
  with:
    contexts: 'env'
```

# Example for multiple contexts
```yaml
- uses: henrygriffiths/debug_action@main
  with:
    contexts: 'env,runner'
```

# Example using matrix
```yaml
job:
  runs-on: ubuntu-latest
  strategy:
    matrix:
      context:
      - github
      - env
      - job
      - steps
      - runner
      - secrets
      - strategy
      - matrix
      - needs
      - inputs
  steps:
  - uses: henrygriffiths/debug_action@main
    with:
      contexts: ${{ matrix.context }}
      secrets_context: ${{ toJson(secrets) }}
      needs_context: ${{ toJson(needs) }}
```


# License

This project is released under the [MIT License](LICENSE)
