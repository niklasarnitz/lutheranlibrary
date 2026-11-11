\version "2.24.3"
% Lochner, Bugenhagen’sche Weise. PDF scan 275, printed p. 250.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper {
  paper-width = 145\mm left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f page-breaking = #ly:one-page-breaking
}
global = { \key f \major \accidentalStyle forget \omit Staff.TimeSignature \cadenzaOn }
\score {
  \new StaffGroup <<
    \new Staff <<
      \clef treble \global
      \new Voice = "pastor" { g'\breve g'\breve a'\breve a'1 a'1 a'1 a'1 a'1 a'1 a'1 bes'\breve a'\breve g'\breve a'\breve }
    >>
    \new Lyrics \lyricsto "pastor" { \set ignoreMelismata = ##t Die -- ser Kelch ist das neu -- e Te -- sta -- ment in mei -- nem "Blut†," }
    \new PianoStaff <<
      \new Staff { \clef treble \global <d' g'>\breve <d' g'>\breve <fis' a'>\breve r1 r1 r1 r1 r1 r1 r1 <g' a' bes'>\breve <fis' a'>\breve <g' g'>\breve <e' a'>\breve }
      \new Staff { \clef bass \global <g bes>\breve <g bes>\breve <d d'>\breve r1 r1 r1 r1 r1 r1 r1 <g d'>\breve <d d'>\breve <bes, d'>\breve <a, cis'>\breve }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
