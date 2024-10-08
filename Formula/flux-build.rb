# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class FluxBuild < Formula
  desc "Build kustomize overlays with flux2 HelmRelease support"
  homepage "https://github.com/DoodleScheduling/flux-build"
  version "2.4.0"

  on_macos do
    on_intel do
      url "https://github.com/DoodleScheduling/flux-build/releases/download/v2.4.0/flux-build_2.4.0_darwin_amd64.tar.gz"
      sha256 "99c837101d28adcf78749df8c03e9bc99e48e57c4d444eec5afa26345cd6f571"

      def install
        bin.install "flux-build"
      end
    end
    on_arm do
      url "https://github.com/DoodleScheduling/flux-build/releases/download/v2.4.0/flux-build_2.4.0_darwin_arm64.tar.gz"
      sha256 "ed1d7e8ace36617dbb02e208bdc12e19b75bbc0601af7e54dc421061641ede2e"

      def install
        bin.install "flux-build"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/DoodleScheduling/flux-build/releases/download/v2.4.0/flux-build_2.4.0_linux_amd64.tar.gz"
        sha256 "e6acb1c4ba44f640207834e4341b2819a4f436077b9951be794c031e78dfeab7"

        def install
          bin.install "flux-build"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/DoodleScheduling/flux-build/releases/download/v2.4.0/flux-build_2.4.0_linux_arm64.tar.gz"
        sha256 "1054b46082c33213e46ff914e14aa9947f50d1ecebda5ff5e849c124575156ad"

        def install
          bin.install "flux-build"
        end
      end
    end
  end

  test do
    system "#{bin}/flux-build -h"
  end
end
