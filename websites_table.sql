-- Create websites table
CREATE TABLE IF NOT EXISTS websites (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  slug VARCHAR(255) NOT NULL UNIQUE,
  description TEXT,
  logo_url VARCHAR(500),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Insert default website data
INSERT INTO websites (id, name, slug, description) VALUES
(1, 'Kelantan Food Review', 'kelantan-food-review', 'Platform review makanan terbaik di Kelantan');

-- Enable Row Level Security (RLS)
ALTER TABLE websites ENABLE ROW LEVEL SECURITY;

-- Create policies untuk read access (public)
CREATE POLICY "Allow public read access to websites" ON websites FOR SELECT USING (true);

-- Create trigger untuk update timestamp
CREATE TRIGGER update_websites_updated_at 
  BEFORE UPDATE ON websites 
  FOR EACH ROW 
  EXECUTE FUNCTION update_updated_at_column();
