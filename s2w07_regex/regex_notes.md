% Regex

# Regex

Tool to search text for specific patterns.
Very flexible.
Similar implementations in many languages, slightly different dialects.
Supported by PostgreSQL using the `~` operator.

# Building a regex

## Anchors

Without an anchor, `^` or `$`, the regex will return true if the specified text exists.

- Use a preceeding `^` for matches *starting with* the specified pattern.
- Use a terminating `$` for matches *ending with* the specified pattern.
- Use both `^` and `$` to match a specific string exactly. (Could just use `LIKE` or `=`!)

## Quantifiers



