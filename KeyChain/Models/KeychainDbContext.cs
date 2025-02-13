using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace KeyChain.Models;

public partial class KeychainDbContext : DbContext
{
    public KeychainDbContext()
    {
    }

    public KeychainDbContext(DbContextOptions<KeychainDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Product> Products { get; set; }

    public virtual DbSet<RandomAnswer> RandomAnswers { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=(local);Database=Keychain;Trusted_Connection=True;TrustServerCertificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Product>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("Product");

            entity.Property(e => e.Answer).HasMaxLength(400);
            entity.Property(e => e.Image).HasMaxLength(200);
            entity.Property(e => e.ProductCode)
                .HasMaxLength(50)
                .IsUnicode(false);
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
