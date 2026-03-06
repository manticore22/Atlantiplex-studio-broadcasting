# Atlantiplex Studio SaaS - Deployment Guide

## 🚀 Quick Deploy

### Option 1: Automated Script (Recommended)

```bash
cd studio-saas
./scripts/deploy.sh
```

### Option 2: Manual Docker Deploy

```bash
cd studio-saas

# 1. Configure environment
cp backend/.env.example backend/.env
nano backend/.env  # Add your Stripe keys

# 2. Start services
docker-compose up -d

# 3. Check status
docker-compose ps
```

## 📝 Pre-Deployment Checklist

- [ ] Domain DNS configured (studio.verilysovereign.online → 76.13.242.128)
- [ ] SSL certificates obtained (Let's Encrypt)
- [ ] Stripe account created
- [ ] Stripe API keys generated
- [ ] Environment variables configured

## 🔐 SSL Certificate Setup

### Using Let's Encrypt

```bash
# Install certbot
apt install certbot

# Generate certificates
certbot certonly --standalone \
  -d studio.verilysovereign.online \
  -d api.verilysovereign.online

# Copy to nginx
sudo cp /etc/letsencrypt/live/studio.verilysovereign.online/fullchain.pem nginx/ssl/cert.pem
sudo cp /etc/letsencrypt/live/studio.verilysovereign.online/privkey.pem nginx/ssl/key.pem
```

## ⚙️ Environment Configuration

Edit `backend/.env`:

```env
# Required
JWT_SECRET=your-super-secret-key-min-32-chars
STRIPE_SECRET=sk_live_your_stripe_key
FRONTEND_URL=https://studio.verilysovereign.online

# Optional
DATABASE_URL=sqlite:///studio.db
SMTP_HOST=smtp.gmail.com
```

## 🧪 Testing

After deployment, test these endpoints:

```bash
# Health check
curl https://studio.verilysovereign.online/api/health

# Test signup
curl -X POST https://studio.verilysovereign.online/api/auth/signup \
  -H "Content-Type: application/json" \
  -d '{"email":"test@test.com","password":"test123"}'
```

## 🔧 Troubleshooting

### Services won't start
```bash
docker-compose logs api
docker-compose logs broadcast
docker-compose logs nginx
```

### Port already in use
```bash
# Check what's using port 80/443
sudo netstat -tulpn | grep :80

# Stop conflicting service
sudo systemctl stop apache2
sudo systemctl stop nginx
```

### SSL certificate errors
```bash
# Test certificate
certbot renew --dry-run

# Check certificate files exist
ls -la nginx/ssl/
```

## 📊 Monitoring

View logs:
```bash
# All services
docker-compose logs -f

# Specific service
docker-compose logs -f api
docker-compose logs -f broadcast
```

Check resource usage:
```bash
docker stats
```

## 🔄 Updates

To update the application:

```bash
# Pull latest code
git pull origin main

# Rebuild and restart
docker-compose down
docker-compose up -d --build
```

## 🆘 Support

If you encounter issues:
1. Check logs: `docker-compose logs`
2. Verify environment: `cat backend/.env`
3. Test API: `curl localhost:3000/api/health`
4. Contact: seraphonixstudios@gmail.com