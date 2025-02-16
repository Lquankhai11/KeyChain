using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace KeyChain.Models;

public partial class KeychainContext : DbContext
{
    public KeychainContext()
    {
    }

    public KeychainContext(DbContextOptions<KeychainContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Image> Images { get; set; }

    public virtual DbSet<Product> Products { get; set; }

    public virtual DbSet<RandomAnswer> RandomAnswers { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=(local);Database=Keychain;Trusted_Connection=True;TrustServerCertificate=True;ConnectRetryCount=3;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Image>(entity =>
        {
            entity.ToTable("Image");

            entity.Property(e => e.Image1)
                .HasMaxLength(400)
                .HasColumnName("Image");
        });

        modelBuilder.Entity<Product>(entity =>
        {
            entity.HasKey(e => e.ProductCode);

            entity.ToTable("Product");

            entity.Property(e => e.ProductCode)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Answer).HasMaxLength(400);
            entity.Property(e => e.Image).HasMaxLength(200);

            entity.HasOne(d => d.KeyImage).WithMany(p => p.Products)
                .HasForeignKey(d => d.KeyImageId)
                .HasConstraintName("FK_Product_Image");
        });

        modelBuilder.Entity<RandomAnswer>(entity =>
        {
            entity.ToTable("RandomAnswer");

            entity.Property(e => e.Answer).HasMaxLength(400);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
