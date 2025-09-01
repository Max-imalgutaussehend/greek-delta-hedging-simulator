# Builder
FROM rust:1.80-slim as builder
WORKDIR /app
COPY . .
RUN cargo build --release

# Runtime
FROM debian:bookworm-slim
WORKDIR /app
COPY --from=builder /app/target/release/greek-delta-hedging-simulator .
CMD ["./greek-delta-hedging-simulator"]
