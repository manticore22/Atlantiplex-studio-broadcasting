# Atlantiplex Studio SaaS - Consolidated Broadcasting Platform

> **Professional Multi-Tenant Broadcasting Studio with Subscription Management**

## 🎯 Overview

This is the consolidated, production-ready version of Atlantiplex Studio, combining:
- ✅ **SaaS Infrastructure**: Authentication, subscriptions, Stripe payments
- ✅ **Broadcasting Engine**: Multi-platform streaming, guest management, scenes
- ✅ **Complete Stack**: Node.js backend + Python broadcasting + React frontend

## 📁 Project Structure

```
studio-saas/
├── backend/
│   ├── server.js              # Main API server (Node.js + Express)
│   ├── app.py                 # Broadcasting API (Flask)
│   ├── scene_manager.py       # Scene switching & overlays
│   ├── guest_management.py    # Guest invite & management
│   ├── broadcast_engine.py    # Streaming to platforms
│   ├── avatar_management.py   # User avatars & profiles
│   ├── package.json           # Node.js dependencies
│   └── data/                  # JSON data storage
├── frontend/
│   └── studio.html            # Studio landing page
├── docs/
│   └── DEPLOYMENT.md          # Deployment guide
└── scripts/
    └── deploy.sh              # Deployment script
```

## 🚀 Quick Start

### Prerequisites
- Node.js 18+
- Python 3.11+
- Docker & Docker Compose

### Installation

```bash
# 1. Clone and enter directory
cd studio-saas

# 2. Install Node.js dependencies
cd backend
npm install

# 3. Install Python dependencies
pip install flask flask-cors pillow

# 4. Configure environment
cp .env.example .env
# Edit .env with your Stripe keys and domain

# 5. Start the server
npm start
```

### Docker Deployment

```bash
# Build and run
docker-compose up -d

# View logs
docker-compose logs -f
```

## 💳 Subscription Tiers

| Tier | Price | Hours | Guests | Platforms | Features |
|------|-------|-------|--------|-----------|----------|
| **Free Trial** | $0 | 16 hours | 4 | 2 | Basic scenes, 720p |
| **Ascendant** | $9.99/mo | 70/mo | 6 | 3 | Advanced scenes, 1080p |
| **Covenant** | $29.99/mo | Unlimited | 8 | All | 4K, custom overlays |
| **Sovereign** | $99.99/mo | Unlimited | 8 | All | White-label, API access |

## 🔧 Configuration

Create `.env` file:

```env
# Server
PORT=3000
JWT_SECRET=your-super-secret-jwt-key

# Stripe
STRIPE_SECRET=sk_live_your_key_here
STRIPE_PUBLISHABLE_KEY=pk_live_your_key_here
STRIPE_WEBHOOK_SECRET=whsec_your_webhook_secret

# Domain
FRONTEND_URL=https://verilysovereign.online
API_URL=https://api.verilysovereign.online

# Database (optional - uses JSON files by default)
DATABASE_URL=sqlite:///studio.db
```

## 📡 API Endpoints

### Authentication
- `POST /api/auth/signup` - Create account
- `POST /api/auth/login` - Login
- `POST /api/auth/logout` - Logout

### Subscriptions
- `GET /api/subscriptions` - Get user's subscription
- `POST /api/subscriptions/create` - Create subscription
- `POST /api/stripe/create-checkout-session` - Stripe checkout

### Broadcasting
- `POST /api/stream/start` - Start stream
- `POST /api/stream/stop` - Stop stream
- `GET /api/stream/status` - Get stream status
- `POST /api/guests/invite` - Invite guest
- `GET /api/scenes` - List scenes
- `POST /api/scenes/switch` - Switch scene

## 🎬 Features

- **Multi-Platform Streaming**: YouTube, Twitch, Facebook, LinkedIn
- **Guest Management**: Up to 8 guests with role-based access
- **Scene Switching**: Professional overlays and transitions
- **Recording**: Archive streams for later
- **Real-time Chat**: Integration with streaming platforms
- **Analytics**: Viewer counts, engagement metrics
- **AI Assistance**: Automated scene suggestions

## 🔐 Security

- JWT-based authentication
- Password hashing with bcrypt
- Rate limiting
- CORS protection
- Input validation
- Secure headers

## 📞 Support

**Studio:** Seraphonix Studios  
**Email:** seraphonixstudios@gmail.com  
**Website:** https://verilysovereign.org  
**Twitter:** [@r1914514](https://twitter.com/r1914514)  
**YouTube:** [@manticore-ubermensch](https://www.youtube.com/@manticore-ubermensch)

## 📄 License

MIT License - See [LICENSE](../LICENSE)

---

**Ready to broadcast?** Start your free 16-hour trial today!
